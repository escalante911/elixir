defmodule ObsTest.Command do
  use ExUnit.Case
  doctest Obs.Command

  test "running command" do
    cmd = {:read, {}}
    assert Obs.Command.run(cmd) == {:ok, "Value: 0\r\n"}
  end

  test "error run" do
    assert Obs.Command.run(nil) == {:error, "UNKNOWN COMMAND nil\r\n"}
    assert Obs.Command.run("in") == {:error, "UNKNOWN COMMAND \"in\"\r\n"}
    assert Obs.Command.run("5") == {:error, "UNKNOWN COMMAND \"5\"\r\n"}
  end

  test "increment and decrement command" do

    assert Obs.Command.run({:increment, 17}) == {:ok, "ok\r\n"}
    assert Obs.Command.run({:read, nil}) == {:ok, "Value: 17\r\n"}

    assert Obs.Command.run({:decrement, 8}) == {:ok, "ok\r\n"}
    assert Obs.Command.run({:read, 0}) == {:ok, "Value: 9\r\n"}

    assert Obs.Command.run({:decrement, 9}) == {:ok, "ok\r\n"}
    assert Obs.Command.run({:read, 0}) == {:ok, "Value: 0\r\n"}
  end

  test "parse error" do
     assert Obs.Command.parse("in") == {:error, :unknown_command}
     assert Obs.Command.parse("in 5") == {:error, :unknown_command}
     assert Obs.Command.parse("6") == {:error, :unknown_command}
     assert Obs.Command.parse("kjuhk") == {:error, :unknown_command}
     assert Obs.Command.parse("read 5") == {:error, :unknown_command}
     assert Obs.Command.parse("read") == {:error, :unknown_command}
     assert Obs.Command.parse("increment") == {:error, :unknown_command}
     assert Obs.Command.parse("decrement") == {:error, :unknown_command}
  end

  test "parse command" do
     assert Obs.Command.parse("increment 5") == {:ok, {:increment, 5}}
     assert Obs.Command.parse("decrement 5") == {:ok, {:decrement, 5}}
     assert Obs.Command.parse("read\r\n") == {:ok, {:read, ""}}
  end



end
