defmodule Evaluacion do
 # Pregunta 2
 def sumr(list) when is_list(list), do: reduce(tl(list), hd(list), &(&1 + &2), [hd(list)])

 def reduce(list, acc, action, lista) when is_list(list) and is_function(action, 2) do
   reducep(list, acc, action, lista)
 end

 defp reducep([], _, _, list), do: list
 defp reducep([h | t], acc, action, lista), do: reducep(t, action.(h, acc), action, lista ++ [action.(h, acc)])
end

IO.inspect Evaluacion.sumr([1, 3, 4, -1])
