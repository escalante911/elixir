defmodule KvEts do
  use ETS.Utils

  def star_link do
    :ets.new(:example, [:set, :protected])
  end

  def read(rq, key) do

  end

  def insert(rq, key, value) do
    :ets.insert(rq, {key, value})
  end


end
