defmodule Balance do
  def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "amount can't be negative"}
      true -> {:ok, spawn(_MODULE_, :listen, [initial_state])}
    end
  end

  def deposit(balance, amount) do
    call(balance, {:deposit, amount, self()})
  end

  def withdraw(balance, amount) do
    call(balance, {:withdraw, amount, self()})
  end

  def call(balance_pid, event) do

  end

end
