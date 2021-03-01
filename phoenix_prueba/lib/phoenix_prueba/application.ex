defmodule PhoenixPrueba.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixPrueba.Repo,
      # Start the Telemetry supervisor
      PhoenixPruebaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixPrueba.PubSub},
      # Start the Endpoint (http/https)
      PhoenixPruebaWeb.Endpoint
      # Start a worker by calling: PhoenixPrueba.Worker.start_link(arg)
      # {PhoenixPrueba.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixPrueba.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixPruebaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
