defmodule VrBackendWeb.TimelineResolver do
  require Logger

  def all_ranges(_root, _args, info) do
    with {:ok, body} <- File.read(info.context.viewer_token <> "-data.json"),
    {:ok, json} <- Poison.decode(body),
    %{"ranges" => ranges} <- json do
      {:ok, ranges}
    else
      err ->
        Logger.error("Error: #{inspect err}")
        {:error, "Server error"}
    end
  end
end
