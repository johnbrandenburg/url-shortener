defmodule FawkesWeb.UrlView do
  use FawkesWeb, :view

  def render("index.json", %{urls: urls}) do
    %{data: render_many(urls, UrlView, "url.json")}
  end

  def render("show.json", %{url: url}) do
    %{data: render_one(url, UrlView, "url.json")}
  end

  def render("url.json", %{url: url}) do
    %{id: url.id,
      short_url: url.short_url,
      long_url: url.long_url}
  end
end
