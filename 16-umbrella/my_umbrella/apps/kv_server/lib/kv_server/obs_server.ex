defmodule Obs.Server do
  require Logger

  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info("Aceptando conexiones en el puerto #{port}")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    Task.start_link(fn -> serve(client) end)
    loop_acceptor(socket)
  end

  defp serve(socket) do
    msg = case read_line(socket) do
      {:ok, data} ->
        Logger.info("Message: #{data}")
        case Obs.Command.parse(data) do
          {:ok, action} -> Obs.Command.run(action)
          {:error, _} = error -> error
        end
        {:error, _} = error -> error
    end
    write_line(msg, socket)
    serve(socket)
  end

  defp read_line(socket), do: :gen_tcp.recv(socket, 0)
  defp write_line(line, socket), do: :gen_tcp.send(socket, "Respuesta: #{line}")
  defp write_line({:error, error}, socket), do: :gen_tcp.send(socket, "Error")

end
