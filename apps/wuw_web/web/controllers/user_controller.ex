defmodule WuwWeb.UserController do
  use WuwWeb.Web, :controller
  alias Biz.{User}

  def index(conn, %{"uuid" => uuid}) do
    case User.by_uuid(uuid) do
      nil -> redirect(conn, to: page_path(conn, :index))
      user -> render conn, "index.html", user: user
    end
  end

  def create(conn, _params) do
    guest = User.create_guest

    conn
    |> put_session(:user, guest.uuid)
    |> redirect(to: user_path(conn, :index, guest.uuid))
  end
end
