defmodule Evaluacion do
  # Pregunta 1
  def sum(list) when is_list(list) and length(list) > 1, do: sump(tl(list), hd(list), [])
  def sum(list) when is_list(list) and length(list) <= 1, do: false
  defp sump([], acc, lista), do: lista ++ [acc]
  defp sump([h | t], acc, lista), do: sump(t, acc + h, lista ++ [acc])

end

IO.inspect Evaluacion.sum([])
IO.inspect Evaluacion.sum([1, 3, 4, -1])
IO.inspect Evaluacion.sum([1, 3, 4, 2, 5, 6])
IO.inspect Evaluacion.sum([1])
