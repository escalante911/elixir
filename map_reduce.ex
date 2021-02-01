defmodule MyMapReduce do
  #def double(list) when is_list(list), do: doublep(list, [])
  def double(list) when is_list(list), do: map(list, &(3 * &1))
  def double2(list) when is_list(list), do: map(list, &(9 * &1))
  def sum(list) when is_list(list), do: reduce(list, 0, &(&2 + &1))
  def fact(list) when is_list(list), do: reduce(list, 0, &(&1 + &2))

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
