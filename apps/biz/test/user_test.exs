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

  test "create_guest" do
    user = User.create_guest
    assert user.uuid != nil
    assert User.by_uuid(user.uuid) == user
  end

  test "by_uuid" do
    assert nil == User.by_uuid("7416aa18-d927-4adc-9891-bc45ebcfc4b7")
    assert nil == User.by_uuid("99")
  end

end

