defmodule Observable do
  @spec create(integer()) :: pid()
  def create(initialState \\ 0) do
    spawn(_MODULE_, :listen, [[], initialState])
  end

  defp listen(observers, state) do
    receive do
      {:attach, observer_pid} ->
        # new_observer = add_observer(observer, observer_pid)
        # listen(new_observer, state)
        observer |> add_observer(observer_pid) |> listen(state)

        {:detach, observer_pid} ->
          # new_observer = remove_observer(observer, observer_pid)
          # listen(new_observer, state)
          observer |> remove_observer(observer_pid) |> listen(state)

          {:increment} ->
            state = state + 1
            notify(observers, state)
            listen(observers, state)

          {:decrement} ->
            state = state - 1
            notify(observers, state)
            listen(observers, state)

          {:read, reader_pid} ->
            send(reader_pid, state)
            listen(observers, state)
    end
  end

  def add_observer(observers, observer_pid), do: [observer_pid | observers]
  def remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  defp notify(observers, state) do
    # Enum.each(observers, fn(obs_id) -> send(obs_pid, state) end)
    # observers |> Enum.each(fn(obs_id) -> send(obs_pid, state) end)
    observers |> Enum.each(&send(&1, state))
  end

  def attach(subject), do: send(subject, {:attach, self()})
  def detach(subject), do: send(subject, {:detach, self()})
  def increment(subject), do: send(subject, {:increment})
  def decrement(subject), do: send(subject, {:decrement})

  def read(subject) do
    send(subject, {:read, self()})
    await()
  end

  def await(millis \\ 1000) do
    receive do
      count -> count
    after
      millins -> :timeout
    end
  end
end
