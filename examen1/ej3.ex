defmodule Evaluacion do
  # Pregunta 3
  def valida([]), do: true
  def valida(list) when is_list(list), do: validap(tl(list), hd(list))
  defp validap([], _), do: true
  defp validap([h | t], com) when com > h, do: validap(t, h)
  defp validap(_, _), do: false
 end
 IO.puts Evaluacion.valida([5, 4])
 IO.puts Evaluacion.valida([5, 4, 3, 2])
 IO.puts Evaluacion.valida([1, 2, 3, 4, 5])
 IO.puts Evaluacion.valida([])
 IO.puts Evaluacion.valida([1])
