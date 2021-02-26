defmodule TestingTest do
  use ExUnit.Case
  doctest PostgresMock

  test "greets the world" do
    handler = %PostgresMock{user_id: 1}
    DbHandler.create_user(handler, %{name: name})
    assert Testing.hello() == :world
  end
end
