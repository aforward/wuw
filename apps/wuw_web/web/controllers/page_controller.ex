defmodule WuwWeb.PageController do
  use WuwWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
