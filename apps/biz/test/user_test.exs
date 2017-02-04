defmodule Biz.UserTest do
  use ExUnit.Case, async: true

  alias Biz.{User,Repo}
  doctest Biz.User

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, %{})
    assert changeset.valid?
  end

end
