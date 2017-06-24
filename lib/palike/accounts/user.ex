defmodule Palike.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Palike.Accounts.User


  schema "accounts_users" do
    field :email, :string
    field :username, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :username])
    |> validate_length(:password, min: 5)
    |> validate_confirmation(:password, message: "Password dows not match")
    |> validate_required([:email, :username])
    |> unique_constraint(:email, message: "Email already taken")
    |> put_password_hash
  end

  def registration_changeset(%User{} = user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, [:email, :password])
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
