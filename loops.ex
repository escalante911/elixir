defmodule loop do

  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i + 1, n, value)
        true ->
          :ok
    end
  end

end

def for_loop1(i, n, value) when i < n do
  IO.puts("#{value} #{i}")
  for_loop1(i + 1, n, value)
end

def for_loop1(_, _, _) do: :ok

def do_while(i, n, value) when i < n do
  IO.puts("#{value} #{i}")
  do_while(i + 1, n, value)
end
