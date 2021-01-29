defmodule Collatz do

  def coll(n)  do
    IO.puts(n)

    if  (rem(n, 2) == 0)  do
      coll(div(n, 2))
    else
      if n == 1 do
        :ok
      else
        coll(((n*3) + 1))
      end
    end

  end
end

Collatz.coll(5)
