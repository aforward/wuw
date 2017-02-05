defmodule WuwWeb.PageController do
  use WuwWeb.Web, :controller

  alias Biz.User

  def index(conn, _params) do
    case get_session(conn, :user) do
      nil -> render conn, "index.html", changeset: User.changeset(%User{})
      uuid -> redirect(conn, to: user_path(conn, :index, uuid))
    end
  end

end
