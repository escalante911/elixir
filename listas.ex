defmodule Math do

  def suma(n) do
    do_sum(n, 0)

  end

  defp invierte(n) do
     str = " "
     imp(n, str)
  end

  defp imp([head|tail], str) do
     imp(tail, str <> head)
  end

  defp do_sum([head|tail], acc) do
     do_sum(tail, head + acc)
  end


  defp do_sum([], acc), do: acc
  defp imp([], str), do: ""


  end
 list = [2, 3, 4]
 IO.puts Math.suma(list)
 IO.puts Math.invierte(list)
