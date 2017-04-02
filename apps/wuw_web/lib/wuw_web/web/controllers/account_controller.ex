defmodule WuwWeb.Web.AccountController do
  use WuwWeb.Web, :controller
  alias Biz.{Account,Repo}

  plug :ensure_user

  def create(conn, %{"account" => params}) do
    params = Map.put(params, "user_id", conn.assigns[:user].id)
    {:ok, account} = %Account{}
      |> Account.changeset(params)
      |> Repo.insert
    render conn, account: account
  end

  def list(conn, _opts) do
    render conn,
      grouped_accounts: Account.latest_for(conn.assigns[:user]),
      layout: {WuwWeb.Web.LayoutView, "partial.html"}
  end

end
