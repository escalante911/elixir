defmodule ListOperations do
  def sum(list) when is_list(list), do: sump(list, 0)
  defp sump([], acc), do: acc
  defp sump([h | t], acc), do: sump(t, acc + h)

  def reverse(list) when is_list(list), do: reversep(list, [])
  defp reversep([h | t], reversedList), do: reversep(t, [h] ++ reversedList)
  defp reversep([], reversedList), do: reversedList

  def reverse1(list) when is_list(list), do: reversep(list, [])
  defp reversep1(list, reversedList, len) when len < 2, do: list ++ reversedList
  defp reversep1([h | t], reversedList, len), do: reversep1(t, [h] ++ reversedList, len - 1)

  #def ascendant?(list) when is_list(list), do: ascendant_p?(nil, list)
  #defp ascendant_p?(_, []), do: true
  #defp ascendant_p?(nill, [b | tail]), do: ascendat_p?(b, tail)
  #defp ascendant_p?(a, [b | tail]) when a <= b, do: ascendant_p?(b, tail)
  #defp ascendant_p?(_, _), do: false
end

IO.puts ListOperations.sum([1, 2, 3])








