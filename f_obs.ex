defmodule FObs do
  @spec create(integer()) :: pid()
  def create(initialState \\ 0) do
    spawn(_MODULE_, :listen, [[], initialState])
  end

  def listen(observers, state) do
    receive do
      event ->
        {observers, state} = on_event(event, observers, state)
        listen(observers, state)
    end
  end

  def add_observer(observers, observer_pid), do: [observer_pid | observers]
  def remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  defp notify(observers, state) do
    observers |> Enum.each(&send(&1, state))
    {observers, state}
  end

  def attach(subject), do: send(subject, {:attach, self()})
  def detach(subject), do: send(subject, {:detach, self()})

  def read(subject) do
    send(subject, {:read, self()})
    await()
  end

  def await(millis \\ 1000) do
    receive do
      count -> count
    after
      millis -> :timeout
    end
  end


end
