defmodule Math do
  @type division_result :: {atom(), number()} | {atom(), atom()}

  @spec div(number(), number) :: division_result()
  def div(a, b) when is_number(a) and is_number(b) do
    try do
      a / b
    rescue
      ArithmeticError -> {:error, :infinity}
    else
      result -> {:ok, result}
    end
  end
end

IO.inspect Math.div(10, 2)
IO.inspect Math.div(0, 0)
IO.inspect Math.div(2, 10)
IO.inspect Math.div(20, 5)
IO.inspect Math.div(1, 0)
IO.inspect Math.div(0, 1)
IO.inspect Math.div(-15, 5)
