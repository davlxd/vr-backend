defmodule VrBackendWeb.RadarResolver do
  require Logger

  def all_blips(_root, _args, info) do
    with {:ok, body} <- File.read(info.context.viewer_token <> "-data.json"),
    {:ok, json} <- Poison.decode(body),
    %{"blips" => blips} <- json do
      {:ok, blips}
    else
      err ->
        Logger.error("Error: #{inspect err}")
        {:error, "Server error"}
    end
  end
end
