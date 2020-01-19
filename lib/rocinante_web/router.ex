defmodule RocinanteWeb.Router do
  use RocinanteWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :members_only do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", RocinanteWeb do
    pipe_through [:browser, :members_only]

    # Routes defined here will require an authenticated user
    get "/", PageController, :index
    resources "/chats", ChatController
  end

  # Other scopes may use custom stacks.
  # scope "/api", RocinanteWeb do
  #   pipe_through :api
  # end
end
