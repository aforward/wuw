defmodule WuwWeb.PageControllerTest do
  use WuwWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "What are you worth?"
  end

end
