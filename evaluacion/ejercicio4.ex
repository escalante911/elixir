defmodule Evaluacion do
# Pregunta 4
def validar(list) when is_list(list), do: reduce(tl(list), hd(list), &((&1 > &2) == true), length(list))

def reduce(list, acc, action, con) when is_list(list) and is_function(action, 2) do
  reducep(list, acc, action, con)
end

defp reducep([], _, _, con) when con == 0, do: true

defp reducep([h | t], acc, action, con), do: reducep(t, action.(h, acc), action, con - 1)
end


IO.puts Evaluacion.validar([5, 4, 7])
