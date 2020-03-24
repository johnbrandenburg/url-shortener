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

  def show(conn, %{"id" => short_url}) do
    with %Schema{long_url: long_url} <- Url.get_url_by_short_url(short_url) do
      redirect(conn, external: long_url)
    end
  end
end
