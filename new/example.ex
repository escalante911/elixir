defmodule Test do
  def start() do
    GenServer.start(__MODULE__, [])
  end

  def init([]) do
    raise "Throw this error"

    {:ok, []}
  end
end

Test.start()
