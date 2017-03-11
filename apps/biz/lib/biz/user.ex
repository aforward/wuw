defmodule Biz.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Biz.{User,Repo}

  schema "users" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :email, :string
    field :role, :string
    field :status, :string
    timestamps()
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:email, :role, :status])
  end

  @doc """
  Create a guest account, which really just has a UUID
  """
  def create_guest do
    {:ok, user} = %User{} |> User.changeset(%{}) |> Repo.insert
    user
  end

  @doc """
  Look up a user by his/her UUID
  """
  def by_uuid(uuid) when is_binary(uuid), do: by_uuid(Ecto.UUID.cast(uuid))
  def by_uuid(:error), do: nil
  def by_uuid({:ok, uuid}), do: Repo.get_by(User, uuid: uuid)

end
