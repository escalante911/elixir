defmodule Fibonacci do
  def fibo(n) when is_number(n) and n > 0, do: reduce(n)


  def map(n, transform) when is_number(n) and is_function(transform, 1) do
    mapp(n, n - 1, transform)
    #reduce(list, [, fn h, acc -> acc ++ [transform.(h)] end)
  end

   defp mapp(n, acc, _), do: acc
   defp mapp(n, acc, transform), do: mapp(n, acc * n, transform)

  def reduce(n) when is_number(n) do
    reducep(n)
  end

   defp reducep(1), do: 1
   defp reducep(n), do: reduce(n - 1) + reducep(n - 2)

end
