defmodule Factorial do
  def factorial(n) when is_number(n), do: reduce(n)

  def ini(n) do
    creaListp(n)
  end


  def creaListp(n) when n > 1 do
     list = n...1
  end


  def map(n, transform) when is_number(n) and is_function(transform, 1) do
    mapp(n, n - 1, transform)
    #reduce(list, [, fn h, acc -> acc ++ [transform.(h)] end)
  end

   defp mapp(n, acc, _), do: acc
   defp mapp(n, acc, transform), do: mapp(n, acc * n, transform)

  def reduce(n) when is_number(n) do
    reducep(n)
  end

   defp reducep(0), do: 1
   defp reducep(n), do: n * reducep(n - 1)

end

IO.inspect(ini(5))
