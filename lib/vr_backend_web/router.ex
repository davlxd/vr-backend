defmodule VrBackendWeb.Router do
  use VrBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", VrBackendWeb do
    pipe_through :api
  end
end
