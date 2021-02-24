defmodule Example.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      # Obs
      # {Obs, name: Obs}
      {Obs, name: :obs}
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end

end

#   [{_, observer, _, _}] = Supervisor.which_children(sup)  R/ [{Obs, #PID<0.213.0>, :worker, [Obs]}]
#   observer
#   #PID<0.213.0>
