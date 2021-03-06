defmodule Balance do
  def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "amount can't be negative"}
      true -> {:ok, spawn(__MODULE__, :listen, [initial_state])}
    end
  end

  defp listen(state) do
    receive do
      {:call, from_id, {cmd, amount}} ->
        {cmd, amount} |> handle_call(from_id, state) |> listen()
      {:cast, {cmd, amount}} ->
        {cmd, amount} |> handle_cast(state) |> listen()
    end
  end



  def reply(from_id, reply, new_state) do
    send(from_id, reply)
    new_state
  end

  def no_reply(new_state), do: new_state

  def call(balance_pid, event) do
    send(balance_pid, {:call, self(), event})

    receive do
      amount -> amount
    end
  end

  def cast(balance_pid, event) do
    send(balance_pid, {:cast, event})
    :ok
  end

  def read(balance), do: call(balance, {:deposit, 0})
  def deposit(balance, amount), do: call(balance, {:deposit, amount})
  def withdraw(balance, amount), do: call(balance, {:withdraw, amount})
  def transfer(balance, amount), do: cast(balance, {:transfer, amount})

  def handle_call({:deposit, amount}, from_id, state) do
    state = state + amount
    reply(from_id, state, state)
  end

  def handle_call({:withdraw, amount}, from_id, state) do
    state = state - amount
    reply(from_id, state, state)
  end

  def handle_cast({:transfer, amount}, state), do: {:noreply, state + amount}
end
