defmodule HttPoisonProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :observer_project,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end


  def application do
    [
      extra_applications: [:logger]
    ]
  end


  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:json, "~> 1.4"}
    ]
  end


end
