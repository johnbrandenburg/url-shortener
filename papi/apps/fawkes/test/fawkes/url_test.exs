defmodule Fawkes.UrlTest do
  use Fawkes.DataCase

  alias Fawkes.Url

  describe "url" do
    alias Fawkes.Url.Schema

    @valid_attrs %{long_url: "some long_url", short_url: 42}
    @invalid_attrs %{long_url: nil, short_url: nil}

    def url_fixture(attrs \\ %{}) do
      {:ok, url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Url.create_url()

      url
    end

    test "get_url_by_short_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Url.get_url_by_short_url(url.short_url) == url
    end

    test "create_url/1 with valid data creates a url" do
      assert {:ok, %Schema{} = url} = Url.create_url(@valid_attrs)
      assert url.long_url == "some long_url"
      assert url.short_url == 42
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Url.create_url(@invalid_attrs)
    end
  end
end
