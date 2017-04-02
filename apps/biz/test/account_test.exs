defmodule Biz.AccountTest do
  use ExUnit.Case, async: true

  alias Biz.{User,Account,Repo}
  doctest Biz.Account

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "latest_for" do
    user = User.create_guest

    assert %{} == Account.latest_for(user)

    {:ok, aaaCash} = Account.changeset(user, "AAA", "10", "Cash") |> Repo.insert
    {:ok, zzzCash} = Account.changeset(user, "ZZZ", "11", "Cash") |> Repo.insert
    {:ok, mmmCash} = Account.changeset(user, "MMM", "12", "Cash") |> Repo.insert

    {:ok, bbbDebt} = Account.changeset(user, "BBB", "-10", "Debt") |> Repo.insert
    {:ok, yyyDebt} = Account.changeset(user, "YYY", "-11", "Debt") |> Repo.insert
    {:ok, pppDebt} = Account.changeset(user, "PPP", "-12", "Debt") |> Repo.insert

    %{"Cash" => all_cash, "Debt" => all_debt} = Account.latest_for(user)
    assert all_cash == [aaaCash, mmmCash, zzzCash]
    assert all_debt == [bbbDebt, pppDebt, yyyDebt]
  end

end

