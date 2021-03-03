defmodule PhoenixPruebaWeb.HelloController do
  use PhoenixPruebaWeb, :controller

  plug PhoenixPruebaWeb.Plugs.Locale, "es"

  def index(conn, _params) do
    render(conn, "index.html")
  end

#  def show(conn, %{"messenger" => messenger}) do
#    render(conn, "show.html", messenger: messenger)
#  end

  def show(conn, %{"messenger" => messenger}) do
    text(conn, "From messenger #{messenger}")
  end

  def test(conn, _params) do
    render(conn, "index.html")
  end

end
