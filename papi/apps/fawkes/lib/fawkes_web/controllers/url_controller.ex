defmodule FawkesWeb.UrlController do
  use FawkesWeb, :controller

  alias Fawkes.Url
  alias Fawkes.Url.Schema

  action_fallback FawkesWeb.FallbackController

  def shrink(conn, %{"longUrl" => long_url}) do
    with {:ok, %Schema{short_url: short_url}} <- Url.create_url(%{long_url: long_url}) do
      conn
      |> put_status(:created)
      |> render("short_url.json", %{short_url: Base.encode16(<<short_url::3*8>>)})
    end
  end

  def stretch(conn, %{"short_url" => short_url_hex}) do
    with {short_url_int, ""} <- Integer.parse(short_url_hex, 16),
         %Schema{long_url: long_url} <- Url.get_url_by_short_url(short_url_int) do
      redirect(conn, external: long_url)
    end
  end
end
