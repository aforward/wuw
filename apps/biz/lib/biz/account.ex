defmodule Biz.Account do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  alias Biz.{Account,User,Slug,Repo}

  @derive {Poison.Encoder, only: [:name, :slug, :amount, :type]}
  schema "accounts" do
    field :name, :string
    field :slug, :string
    field :amount, :decimal
    field :type, :string
    belongs_to :user, User
    timestamps()
  end

  @doc """
    Create a change for a new account
  """
  def changeset(%User{id: user_id}, name, amount, type) do
    changeset(%Account{}, %{"name": name, "amount": amount, "type": type, "user_id": user_id})
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :slug, :amount, :type, :user_id])
    |> ChangesetMerger.Slug.derive_if_missing
    |> foreign_key_constraint(:user_id)
  end

  @doc """
  Find the latest accounts for the provided user
  """
  def latest_for(%User{id: id}) do
    Repo.all(from(a in Account, where: a.user_id == ^id, order_by: [a.type, a.name]))
    |> group_accounts
  end

  defp group_accounts(accounts), do: group_accounts(%{}, accounts)
  defp group_accounts(answer, []), do: answer
  defp group_accounts(answer, [account|remaining]) do
    answer
    |> Map.update(account.type, [account], &(&1 ++ [account]))
    |> group_accounts(remaining)
  end

end