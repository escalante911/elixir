defmodule ObsTest do
  use ExUnit.Case
  doctest ObsTest

  test "Initial state" do
    subject = Obs.create()
    assert Obs.read(subject) == 0

    subject = Obs.create(0)
    assert Obs.read(subject) == 0

    subject = Obs.create(1)
    assert Obs.read(subject) == 1
  end

  test "attach y detach, increment and notify" do
    subject = Obs.create()
    Obs.increment(subject)
    assert Obs.await() == :timeout

    Obs.attach(subject)
    Obs.increment(subject)
    assert Obs.await() == :timeout

    Obs.detach(subject)
    Obs.increment(subject)
    assert Obs.await() == :timeout
  end

  test "attach y detach, decrement and notity" do
    subject = Obs.create(5)
    Obs.decrement(subject)
    assert Obs.await() == :timeout

    Obs.attach(subject)
    Obs.decrement(subject)
    assert Obs.await() == 3

    Obs.detach(subject)
    Obs.decrement(subject)
    assert Obs.await() == :timeout
  end
end
