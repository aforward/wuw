defmodule WuwWeb.Web.Controllers.Helper do
  use Phoenix.Controller
  alias WuwWeb.Web.Router.Helpers, as: Router
  alias Biz.User

  def ensure_user(conn, _opts) do
    case User.by_uuid(conn.path_params["uuid"]) do
      nil ->
        conn
        |> redirect(to: Router.page_path(conn, :index))
        |> halt
      user -> assign(conn, :user, user)
    end
  end

end
