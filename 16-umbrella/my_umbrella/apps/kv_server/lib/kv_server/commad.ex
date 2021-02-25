defmodule KVServer.Command do
  def run(_command) do
    {:ok, "OK\r\n"}
  end

  def parse(msg) do
    case msg do
      "boom\r\n" -> {:error, :unknown_command}
      _          -> {:ok, msg}
    end
  end
end
