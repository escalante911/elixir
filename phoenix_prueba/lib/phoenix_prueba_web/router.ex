defmodule PhoenixPruebaWeb.Router do
  use PhoenixPruebaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PhoenixPruebaWeb.Plugs.Locale, "es"
  end

  pipeline :review_checks do
    plug :browser
#    plug :ensure_authenticated_user
#    plug :ensure_user_owns_review
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixPruebaWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
#    get "/hello/:messenger", HelloController, :show
#    get "/", PageController, :test

#    resources "/users", UserController
#    resources "/hello", HelloController, only: [:index, :show]
#    resources "/posts", PostController, only: [:index, :show]
#    resources "/comments", CommentController, except: [:delete]
#    resources "/reviews", ReviewController
  end

    resources "/users", UserController do
    resources "/posts", PostController
  end

  scope "/admin", PhoenixPruebaWeb.Admin, as: :admin do
    pipe_through :browser

    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end

#  scope "/api", PhoenixPruebaWeb.Api, as: :api do
#    pipe_through :api
#
#    scope "/v1", V1, as: :v1 do
#      resources "/images",  ImageController
#      resources "/reviews", ReviewController
#      resources "/users",   UserController
#    end
#  end

  scope "/", PhoenixPruebaWeb do
    pipe_through :browser

    resources "/users", UserController
  end

  scope "/", AnotherAppWeb do
    pipe_through :browser

    resources "/posts", PostController
  end

  scope "/reviews", PhoenixPruebaWeb do
    pipe_through [:browser, :review_checks]

    resources "/", ReviewController
  end

  forward "/jobs", BackgroundJob.Plug

#  scope "/" do
#    pipe_through [:authenticate_user, :ensure_admin]
#    forward "/jobs", BackgroundJob.Plug
#    forward "/jobs", BackgroundJob.Plug, name: "PhoenixPrueba Phoenix"
#  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixPruebaWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PhoenixPruebaWeb.Telemetry
    end
  end
end
