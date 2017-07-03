defmodule Palike.Router do
  use Palike.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer "
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Palike do
    pipe_through :api

    scope "/v1" do
      post "/registrations", RegistrationController, :create
      options "/registrations", RegistrationController, :options
      post "/sessions", SessionController, :create
      delete "/sessions", SessionController, :delete
      options "/sessions", SessionController, :options
      get "/me", MeController, :show
    end
  end
end
