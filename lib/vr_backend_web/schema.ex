defmodule VrBackendWeb.Schema do
  require Logger

  use Absinthe.Schema
  alias VrBackendWeb.RadarResolver
  alias VrBackendWeb.TimelineResolver

  def stringify_key_middleware(middleware, field, object) do
    new_middleware = {Absinthe.Middleware.MapGet, to_string(field.identifier)}
    middleware |> Absinthe.Schema.replace_default(new_middleware, field, object)
  end

  def middleware(middleware, field, object = %{identifier: :blip}) do
    stringify_key_middleware(middleware, field, object)
  end
  def middleware(middleware, field, object = %{identifier: :range}) do
    stringify_key_middleware(middleware, field, object)
  end
  def middleware(middleware, field, object = %{identifier: :project}) do
    stringify_key_middleware(middleware, field, object)
  end
  def middleware(middleware, _, _), do: middleware


  object :blip do
    field :name, non_null(:string)
    field :quadrant, non_null(:string)
    field :score, non_null(:integer)
    field :desc, :string
  end

  object :range do
    field :from, non_null(:string)
    field :to, non_null(:string)
    field :desc, non_null(:string)
  end

  query do
    field :all_blips, non_null(list_of(non_null(:blip))) do
      resolve &RadarResolver.all_blips/3
    end
    field :all_ranges, non_null(list_of(non_null(:range))) do
      resolve &TimelineResolver.all_ranges/3
    end
  end
end
