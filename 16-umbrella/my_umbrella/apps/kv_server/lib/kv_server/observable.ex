defmodule Counter do
  use GenServer

  def create(initialValue \\ 0), do: GenServer.start_link(__MODULE__, {[], initialValue}, name: __MODULE__)

  def init(value), do: {:ok, value}

  def read(subject), do: GenServer.call(subject, :read)
  def increment(subject, amount), do: GenServer.cast(subject, {:increment, amount})
  def decrement(subject, amount), do: GenServer.cast(subject, {:decrement, amount})

  def handle_cast({:increment, amount}, {observers, value}) do
    value = value + amount
    {:noreply, {observers, value}}
  end

  def handle_cast({:decrement, amount}, {observers, value}) do
    value = value - amount
    {:noreply, {observers, value}}
  end

  def handle_call(:read, _from_id, {observers, value}) do
    {:reply, value, {observers, value}}
  end

end
