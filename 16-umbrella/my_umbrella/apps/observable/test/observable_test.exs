defmodule ObservableTest do
  use ExUnit.Case
  doctest Observable

  test "greets the world" do
    assert Observable.hello() == :world
  end
end
