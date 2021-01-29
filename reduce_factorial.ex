defmodule Factorial do
  @moduledoc """
    Factorial for a given non-negative number
  """
  def run(0), do: 1
  def run(num) when num > 0 do
    Enum.reduce 1..num, 1, &(&1 * &2)
  end
  def run(_), do: nil
end
