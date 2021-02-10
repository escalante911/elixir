defmodule KvEts do

  def star_link do
    :ets.new(:my_bucket, [:set, :protected])
  end

  def read(ref, key) do
     case :ets.lookup(ref, key) do
       [] -> nil
       [{_, value}] -> value
     end
  end

  def insert(ref, key, value) do
    :ets.insert(ref, {key, value})
    ref
  end

  def update(ref, key, value) do
    :ets.insert(ref, {key, value})
  end
end

ets = KvEts.star_link()

KvEts.insert(ets, :name, "Jose")
KvEts.insert(ets, :lastname, "Escalante")

name = KvEts.read(ets, :name)
lastname = KvEts.read(ets, :lastname)

IO.puts("#{name} #{lastname}")
