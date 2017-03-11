defmodule Biz.Repo.Migrations.AddAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :slug, :string
      add :amount, :numeric
      add :type, :string
      add :user_id, references(:users)
      timestamps()
    end
  end
end
