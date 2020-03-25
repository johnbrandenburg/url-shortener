defmodule FawkesWeb.UrlControllerTest do
  use FawkesWeb.ConnCase

  @create_attrs %{"longUrl" => "some long_url"}
  @invalid_attrs %{"longUrl" => nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "shrink and stretch" do
    test "renders short url when data is valid", %{conn: conn} do
      conn = post(conn, Routes.url_path(conn, :shrink), @create_attrs)
      assert %{"shortUrl" => short_url} = json_response(conn, 201)

      conn = get(conn, Routes.url_path(conn, :stretch, short_url))

      assert html_response(conn, 302)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.url_path(conn, :shrink), @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
