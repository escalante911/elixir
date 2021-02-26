defmodule Obs.Command do
  require Logger

  def run(command) do

    case command do
       {:read, _} -> {:ok, "Value: #{Counter.read(Counter)}\r\n"}
       {:increment, parametro} -> {:ok, "#{Counter.increment(Counter, parametro)}\r\n"}
       {:decrement, parametro} -> {:ok, "#{Counter.decrement(Counter, parametro)}\r\n"}
       _ -> {:error, "UNKNOWN COMMAND #{inspect command}\r\n"}
    end
  end

  def parse(msg) do
    val = String.split(msg, " ") |> Enum.at(1)
    value = cond do
      val != nil -> String.replace(val, "\r\n", "")
      true -> nil
    end
    case String.split(msg, " ") do
      ["read\r\n"] -> {:ok, {:read, ""}}
      ["increment", _] -> {:ok, {:increment, String.to_integer value}}
      ["decrement", _] -> {:ok, {:decrement, String.to_integer value}}
      _ ->
        {:error, :unknown_command}
    end
  end
end

#  telnet 127.0.0.1 8000
