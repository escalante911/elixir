defmodule GsObserver do
  use GenServer
  @enforce_keys :value
  defstruct [:value, observers: []]

  def create(initial_value \\ 0) do
    state = %GsObserver{value: inicial_value}
    GenServer.start_link(__MODULE__, state)
  end

  def init(state), do: {:ok, state}

  def add_observer(observers, observer_pid), do: [observer_pid | observers]
  def remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  def read(subject), do: GenServer.call(subject, :read)
  def attach(subject), do: GenServer.cast(subject, {:attach, self()})
  def detach(subject), do: GenServer.cast(subject, {:detach, self()})
  def increment(subject, amount), do: GenServer.cast(subject, {:increment, amount})
  def decrement(subject, amount), do: GenServer.cast(subject, {:decrement, amount})

  def handle_call(:attach, {observer_pid, _}, {observers, value}) do
    observers = observers |> add_observer(observer_pid)
    {:noreply, {observers, value}}
  end

  def handle_call(:detach, {observer_pid, _}, {observers, value}) do
    observers = observers |> remove_observer(observer_pid)
    {:noreply, {observers, value}}
  end

  def handle_cast(:increment, {observers, value}) do
    value = value + 1
    result = observers |> notify(value)
    {:noreply, result}
  end

  def handle_cast(:decrement, {observers, value}) do
    value = value - 1
    result = observers |> notify(value)
    {:noreply, result}
  end

  def handle_call(:read, _from_id, {observers, value}) do
    {:reply, value, {observers, value}}
  end

  def notify(observers, amount) do
    observers |> Enum.each(&send(&1, amount))
    {observers, amount}
  end

end
