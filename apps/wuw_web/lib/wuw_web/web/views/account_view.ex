defmodule WuwWeb.Web.AccountView do
  use WuwWeb.Web, :view

  def render("create.json", %{account: account}) do
    account |> Poison.encode!
  end

  def format_money(amount), do: amount |> Number.Currency.number_to_currency

end
