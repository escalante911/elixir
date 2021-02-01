defmodule Soluciones do
  def factorial(n) when is_number(n), do: reduce([n], n - 1, &(&1 * &1))


  def map(list, transform) when is_list(list) and is_function(transform, 1) do
    mapp(list, [], transform)
    #reduce(list, [, fn h, acc -> acc ++ [transform.(h)] end)
  end

   defp mapp([], acc, _), do: acc
   defp mapp([h | t], acc, transform), do: mapp(t, acc ++ [transform.(h)], transform)

  def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
    reducep(list, acc, action)
  end

   defp reducep([], acc, _), do: acc
   defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)

end
