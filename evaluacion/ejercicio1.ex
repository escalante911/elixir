defmodule Evaluacion do
  # Pregunta 1
  def sum(list) when is_list(list), do: sump(tl(list), hd(list), [])
  defp sump([], acc, lista), do: lista ++ [acc]
  defp sump([h | t], acc, lista), do: sump(t, acc + h, lista ++ [acc])

end

IO.inspect Evaluacion.sum([1, 3, 4, -1])
