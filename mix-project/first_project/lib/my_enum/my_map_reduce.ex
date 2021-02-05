defmodule MyMapReduce do
  #def double(list) when is_list(list), do: doublep(list, [])
  def double(list) when is_list(list), do: map(list, &(2 * &1))
  def sum(list) when is_list(list), do: reduce(list, 0, &(&1 + &2))

  def map(list, transform) when is_list(list) and is_function(transform, 1) do
      #mapp(list, [], transform)
      reduce(list, [], fn h, acc -> acc ++ [transform.(h)] end)
  end

  defp mapp([], acc, _), do: acc
  defp mapp([h | t], acc, transform), do: mapp(t, acc ++ [transform.(h)], transform)

  def filter(list, condition) when is_list(list) and is_function(condition, 1) do
       #Enum.filter()
       #filterp(list, condition, [])
       reduce(list, [], &(if condition?.(&1), do: &2 ++ [&1], else: &2))
  end

  defp filterp([], _, _, list), do: list
  defp filterp([h | t], condition, lista) when condition.(h) == true, do: filterp(t, action, list ++ [h])
  defp filterp([h | t], condition, lista), do: filterp(t, condition, lista)



  def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
    reducep(list, acc, action)
  end

  defp reducep([], acc, _), do: acc
  defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)

end

IO.inspect MyMapReduce.filter([1, 2, 3, 4, 5, 6], &(rem(&1, 2) == 0))
