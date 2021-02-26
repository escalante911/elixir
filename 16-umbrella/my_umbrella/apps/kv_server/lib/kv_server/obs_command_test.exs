ExUnit.start()
defmodule ObsTest.Command do
  use ExUnit.Case
  doctest Obs.Command

  test "running command" do
    cmd = {:read, {}}
    assert Obs.Command.run(cmd) == {:ok, "Value: 0\r\n"}
  end

  test "increment command" do
    cmd = {:increment, 0}
    assert Obs.Command.run(cmd) == {:ok}
  end

  test "decrement command" do
    cmd = {:decrement, 0}
    assert Obs.Command.run(cmd) == {:ok}
  end

  # test "ignore command" do
  #  assert Obs.Command.run(_) == {:ok, _}
  # end


end
