defmodule FawkesWeb.UrlController do
  use FawkesWeb, :controller

  alias Fawkes.Url
  alias Fawkes.Url.Schema

  action_fallback FawkesWeb.FallbackController

  def create(conn, %{"url" => url_params}) do
    with {:ok, %Schema{} = url} <- Url.create_url(url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.url_path(conn, :show, url))
      |> render("url.json", url: url)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Url.get_url!(id)
    render(conn, "url.json", url: url)
  end
end
