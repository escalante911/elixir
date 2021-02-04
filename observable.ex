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


    end
  end





end
