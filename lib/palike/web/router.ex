defmodule Palike.Web.Router do
  use Palike.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Palike.Web do
    pipe_through :api

    resources "/users", UserController
  end
end
