defmodule GsObsTest do
  use ExUnit.Case
     doctest Obs

     test "Inicial" do

      {:ok, subject} = Obs.create()
      assert Obs.read(subject) == 0

      {:ok, subject} = Obs.create(0)
      assert Obs.read(subject) == 0

      {:ok, subject} = Obs.create(1)
      assert Obs.read(subject) == 1
     end

     test "atach" do
      {:ok, subject} = Obs.create()
      Obs.increment(subject)
      assert Obs.await() == "There was not answer"

      Obs.attach(subject)
      Obs.increment(subject)
      assert_receive 2

      Obs.detach(subject)
      Obs.increment(subject)
      assert Obs.await() == "There was not answer"
     end

      #Obs.attach(subject)
      #Obs.read(subject) |> IO.puts()
      #Obs.increment(subject)
      #Obs.await() |> IO.puts()
      #Obs.increment(subject)
      #Obs.await() |> IO.puts()
      #Obs.decrement(subject)
      #Obs.await() |> IO.puts()
      #Obs.detach(subject)
      #Obs.increment(subject)
      #Obs.await() |> IO.puts()
      #IO.puts("The Counter is")

end
