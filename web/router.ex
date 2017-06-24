defmodule Palike.Router do
  use Palike.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Palike do
    pipe_through :api

    scope "/v1" do
      post "/registrations", RegistrationController, :create

      post "/sessions", SessionController, :create
      delete "/sessions", SessionController, :delete

      get "/me", MeController, :show
    end
  end
end
