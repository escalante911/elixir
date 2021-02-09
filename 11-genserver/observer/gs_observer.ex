defmodule GsObservable do
  use GenServer

  def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "valor negativo"}
      true -> GenServer.start_link((__MODULE__, initial_state))
    end
  end

  def init(state), do: {:ok, state}

  def listen(observer, state), do: GenServer.call(observer, state)
  def attach(subject), do: GenServer.call(subject, {:attach, self()})
  def detach(subject), do: GenServer.call(subject, {:detach, self()})
  def increment(subject), do: GenServer.call(subject, {:increment})
  def decrement(subject), do: GenServer.call(subject, {:decrement})
  def read(subject), do: GenServer.call(subject, {:read, self()})



  def handle_call({:increment, state}) do
    state = state + 1
    notify(observers, state)
    listen(observers, state)
  end

  def handle_call({:decrement, state}) do
    state = state - 1
    notify(observers, state)
    listen(observers, state)
  end

  def handle_cast({:read, reader_pid}) do
    send(reader_pid, state)
    listen(observers, state)
  end

end
