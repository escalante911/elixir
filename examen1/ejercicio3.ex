defmodule Evaluacion do
 # Pregunta 3
 def valida(list) when is_list(list), do: validap(tl(list), 1, length(list), hd(list))
 defp validap([], acc, n, _) when acc == n, do: true
 defp validap([h | t], acc, n, com) when com > h, do: validap(t,  acc + 1, n, h)
 defp validap(_, acc, n, _) when acc < n, do: false
end
IO.puts Evaluacion.valida([5, 4])
IO.puts Evaluacion.valida([5, 4, 3, 2])
IO.puts Evaluacion.valida([1, 2, 3, 4, 5])
#IO.puts Evaluacion.valida([])
IO.puts Evaluacion.valida([1])
