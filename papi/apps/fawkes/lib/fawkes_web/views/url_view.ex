defmodule FawkesWeb.UrlView do
  use FawkesWeb, :view

  def render("url.json", %{url: url}) do
    %{id: url.id,
      short_url: url.short_url,
      long_url: url.long_url}
  end

  def render("short_url.json", %{short_url: short_url}) do
    %{shortUrl: short_url}
  end
end
