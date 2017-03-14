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
    pipe_through :browser

    get "/", PageController, :index

    post "/", UserController, :create
    get "/logout", UserController, :logout
    get "/u/:uuid", UserController, :index

  end

  scope "/api", WuwWeb.Web do
    pipe_through :api
    post "/u/:uuid/account", AccountController, :create
  end

  scope "/hpi", WuwWeb.Web do
    pipe_through :browser

    get "/u/:uuid/accounts", AccountController, :list
  end


  # Other scopes may use custom stacks.
  # scope "/api", WuwWeb do
  #   pipe_through :api
  # end
end
