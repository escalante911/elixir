defmodule MyMapReduce do
  #def double(list) when is_list(list), do: doublep(list, [])
  def double(list) when is_list(list), do: map(list, &(2 * &1))
  defp doublep([], acc), do: acc
  defp doublep([h | t], acc), do: doublep(t, acc ++ [2 * h])

  def map(list, transform) when is_list(list) and is_function(transform, 1) do
      mapp(list, [], transform)
  end

  defp mapp([], acc, _), do: acc
  defp mapp([h | t], acc, transform), do: mapp(t, acc ++ [transform.(h)], transform)

  def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
     reducep(list, acc, action)
  end

  defp reducep([], acc, _), do: acc
  defp reducep([h | t], acc, action), do: mapp(t, action.(h, acc), action)

end



