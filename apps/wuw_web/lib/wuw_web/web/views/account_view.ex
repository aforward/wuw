defmodule WuwWeb.Web.AccountView do
  use WuwWeb.Web, :view

  def render("create.json", %{account: account}) do
    account |> Poison.encode!
  end
end
