defmodule Obs.Command do
  require Logger

  def run(command) do

    case command do
       {:read, _} -> {:ok, "Value: #{Obs.read(Obs)}\r\n"}
       {:increment, parametro} -> {:ok, "#{Obs.increment(Obs, parametro)}\r\n"}
       {:decrement, parametro} -> {:ok, "#{Obs.decrement(Obs, parametro)}\r\n"}
       _ -> {:error, "#{command}"}
    end
  end

  def parse(msg) do
    case String.split(msg, " ") do
      ["read\r\n"] -> {:ok, {:read, ""}}
      ["increment", val] -> {:ok, {:increment, String.to_integer val}}
      ["decrement", val] -> {:ok, {:decrement, String.to_integer val}}
      _ ->
        {:error, :unknown_command}
    end
  end
end
