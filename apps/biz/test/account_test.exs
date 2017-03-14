defmodule Biz.AccountTest do
  use ExUnit.Case, async: true

  alias Biz.{User,Account,Repo}
  doctest Biz.Account

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "latest_for" do
    user = User.create_guest

    assert [] == Account.latest_for(user)

    {:ok, account} = Account.changeset(user, "PCF", "10", "Cash") |> Repo.insert
    assert [account] == Account.latest_for(user)
  end

end

