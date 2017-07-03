defmodule Palike.RegistrationView do
  use Palike.Web, :view

  def render("show.json", %{jwt: jwt, user: user}) do
    %{
      jwt: jwt,
      user: user
    }
  end

  def render("error.json", %{error: error}) do
    %{error: error}
  end
end
