defmodule Evaluacion do
  # Pregunta 1
  def sum(list) when is_list(list), do: sump(tl(list), hd(list), [])
  defp sump([], acc, lista), do: lista ++ [acc]
  defp sump([h | t], acc, lista), do: sump(t, acc + h, lista ++ [acc])

  # Pregunta 2

  # Pregunta 3
  def valida(list) when is_list(list), do: validap(tl(list), 1, length(list), hd(list))
  defp validap([], acc, n, _) when acc == n, do: true
  defp validap([h | t], acc, n, com) when com > h, do: validap(t,  acc + 1, n, h)
  defp validap(_, acc, n, _) when acc < n, do: false


  # Pregunta 4

  # Pregunta 5

end

IO.inspect Evaluacion.sum([1, 3, 4, -1])
IO.puts Evaluacion.valida([5, 4])
