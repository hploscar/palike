defmodule Palike.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Palike.Accounts.User


  schema "accounts_users" do
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
