defmodule Evaluacion do
# Pregunta 4
def validar(list) when is_list(list), do: reduce(tl(list), hd(list), &((&1 > &2)== true), length(list) - 1)

def reduce(list, acc, action, con) when is_list(list) and is_function(action, 2) do
  reducep(list, acc, action, con)
end

defp reducep([], _, _, con) when con == 0, do: "J #{true}, #{con}"
defp reducep([h | t], acc, action, con), do: reducep(t, action.(acc, h), action, con - 1)
defp reducep([], _, _, con) when con > 0, do: "M #{false}, #{con}"
end


IO.puts Evaluacion.validar([5, 4])
IO.puts Evaluacion.validar([5, 4, 7])
