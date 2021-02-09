defmodule GsObserver do
  use GenServer

  def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "valor negativo"}
      true -> GenServer.start_link(__MODULE__, initial_state)
    end
  end

  def init(state), do: {:ok, state}

  def add_observer(observers, observer_pid), do: [observer_pid | observers]
  def remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  def read(subject), do: GenServer.call(subject, :read)
  def attach(subject), do: GenServer.cast(subject, {:attach, self()})
  def detach(subject), do: GenServer.cast(subject, {:detach, self()})
  def increment(subject, amount), do: GenServer.cast(subject, {:increment, amount})
  def decrement(subject, amount), do: GenServer.cast(subject, {:decrement, amount})

  def handle_cast({:attach, observer_pid}, {observers, value}) do
    observers = observers |> add_observer(observer_pid)
    {:noreply, {observers, value}}
  end

  def handle_cast({:detach, observer_pid}, {observers, value}) do
    observers = observers |> remove_observer(observer_pid)
    {:noreply, {observers, value}}
  end

  def handle_cast({:increment, amount}, {observers, value}) do
    value = value + amount
    notify(observers, {:increment, amount})
    {:noreply, {observers, value}}
  end

  def handle_cast({:decrement, amount}, {observers, value}) do
    value = value - amount
    notify(observers, {:increment, amount})
    {:noreply, {observers, value}}
  end

  def handle_call(:read, _from_id, {observers, value}) do
    {:reply, value, {observers, value}}
  end

  def notify(observers, value) do
    observers |> Enum.each(&send(&1, value))
    {observers, value}
  end

end
