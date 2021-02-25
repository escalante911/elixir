defmodule ObsTest.Command do
  use ExUnit.Case
  doctest Obs.Command

  test "running command" do
    cmd = {:read, {}}
    assert Obs.Command.run(cmd) == {:ok, "Valor: 0\r\n"}
  end

  test "running command" do
    cmd = {:increment, param}
    assert Obs.Command.run(cmd) == {:ok, "value\r\n"}
  end

  test "running command" do
    cmd = {:decrement, param}
    assert Obs.Command.run(cmd) == {:ok, "value\r\n"}
  end

  test "running command" do
    assert Obs.Command.run(_) == {:ok, _}
  end

  test "parse command" do
    cmd = {:read, {}}
    assert Obs.Command.run(cmd) == {:ok, "Valor: 0\r\n"}
  end

end
