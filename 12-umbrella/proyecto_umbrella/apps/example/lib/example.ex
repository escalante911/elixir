defmodule Example do
  @moduledoc """
  Documentation for `Example`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Example.hello()
      :world

  """
  def hello do
    :world
  end

  def inicio() do
    {:ok, observer} = Obs.create(0)
    Obs.read(observer) |> IO.inspect()
    Obs.attach(observer) |> IO.inspect()
    Obs.increment(observer, 100)
    Obs.decrement(observer, 10)
    Obs.read(observer) |> IO.inspect()
  end

end
