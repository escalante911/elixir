defmodule Descendat do
  def descendat?(list \\ []) when is_list(list) do
   {is_decendant, _} = reduce(list, {true, nil}, fn head, {canContinue, min} ->
        cond do
        !canContinue -> {canContinue, min}
        min == nil -> {canContinue, min}
        head < min -> {canContinue, min}
        true -> {false, min}
      end
    end)
    is_decendant
  end

  def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
    reducep(list, acc, action)
  end

  defp reducep([], acc, _), do: acc
  defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)

end

IO.inspect Descendat.descendat?([5, 4, 3, 2])
IO.inspect Descendat.descendat?([1, 2, 3, 4])
IO.inspect Descendat.descendat?([-1, -2, -3, -4])
IO.inspect Descendat.descendat?([1, 2, 3, 4])
IO.inspect Descendat.descendat?([7, 6, 5, 9, 8])
IO.inspect Descendat.descendat?([5, 4, 1, 2, 7, 3])
