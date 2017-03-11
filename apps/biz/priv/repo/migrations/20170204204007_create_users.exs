defmodule Biz.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :uuid, :uuid
      add :email, :string
      add :role, :string
      add :status, :string
      timestamps()
    end
  end

end
