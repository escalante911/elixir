defmodule Prueba do

  def lista(n) do
    #do_while(1, n + 1, [])
    list = [] ++ do_while(1, n + 1, [])
    list
  end

  def do_while(i, n, lista) when i < n do
    lista = lista ++ [i]
    IO.inspect lista
    if(n == n - 1) do
      lista
    else
      do_while(i + 1, n, lista)
    end
  end
  end

  #Simply write out the numbers 0-10
  IO.inspect Prueba.lista(5)
