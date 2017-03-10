defmodule WuwWeb.Web.Router do
  use WuwWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WuwWeb.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    post "/", UserController, :create
    get "/logout", UserController, :logout
    get "/u/:uuid", UserController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", WuwWeb do
  #   pipe_through :api
  # end
end
