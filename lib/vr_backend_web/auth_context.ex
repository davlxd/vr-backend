defmodule VrBackendWeb.AuthContext do
  require Logger

  @behaviour Plug
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Logger.info "Logging this context: #{inspect context}"

    if context == %{} do
      conn
      |> send_resp(:unauthorized, Poison.encode!(%{error: ["Unauthorized"]}))
      |> halt
    else
      Absinthe.Plug.put_options(conn, context: context)
    end
  end

  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
    {:ok, token} <- verify_viewer_token(token) do
      %{viewer_token: token}
    else
      _ -> %{}
    end
  end

  defp verify_viewer_token(nil), do: {:error, "No Token"}
  defp verify_viewer_token(""), do: {:error, "No Token"}
  defp verify_viewer_token(token) do
    if File.exists?(token <> "-data.json"), do: {:ok, token}, else: {:error, "No Data"}
  end

end
