defmodule Palike.Repo.Migrations.UpdateUsersTable do
  use Ecto.Migration

  def change do
    alter table(:accounts_users) do
      add :username, :string
      add :password_hash, :string
    end

    create unique_index(:accounts_users, [:username])
    create unique_index(:accounts_users, [:email])
  end
end
