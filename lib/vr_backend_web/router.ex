defmodule VrBackendWeb.Router do
  use VrBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug VrBackendWeb.AuthContext
  end

  if Mix.env == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: VrBackendWeb.Schema,
    interface: :advanced
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: VrBackendWeb.Schema
  end
end
