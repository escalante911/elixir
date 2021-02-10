defmodule KvEts do
  use ETS.Utils

  @initial_state {:hello, "world"}

  def star_link do
    table = :ets.new(:example, [:set, :protected])
    :ets.inspect(table, @initial_state)
    table
  end

  def read(ref, key) do
     [{_, value}] = :ets.lookup(ref, key)
  end

  def insert(rq, key, value) do
    :ets.insert(rq, {key, value})
    ref
  end

  def actualizar(ref, key, value) do
    :ets.insert(ref, {key, value})
  end
end

ets = kv_ets.star_link()
