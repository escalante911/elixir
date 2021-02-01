defmodule Ejercicios do

  def tmul(n) do
    IO.puts("Tabla del #{n}")
    prod(n, 1)

  end

  def prod(a, b) do
    IO.puts("#{a} x #{b} = #{a * b}")
    if  (b < 12)  do
      prod(a, b + 1)
    else
      if b == 12 do :ok end
    end
  end

end

Ejercicios.tmul(5)
