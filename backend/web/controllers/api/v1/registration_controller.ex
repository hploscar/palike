defmodule Palike.RegistrationController  do
  use Palike.Web, :controller

  alias Palike.{Repo, User}

  plug :scrub_params, "data" when action in [:create]

  def create(conn, %{"data" => user_params}) do
    changeset = User.changeset(%User{}, user_params["attributes"])

    case Repo.insert(changeset) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :token)

        conn
        |> put_status(:created)
        |> render(Palike.RegistrationView, "show.json", jwt: jwt, user: user)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Palike.RegistrationView, "error.json", error: changeset.errors)
    end
  end
end
