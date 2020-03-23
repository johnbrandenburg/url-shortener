defmodule Fawkes.UrlTest do
  use Fawkes.DataCase

  alias Fawkes.Url

  describe "urls" do
    alias Fawkes.Url.Schema

    @valid_attrs %{long_url: "some long_url", short_url: 42}
    @update_attrs %{long_url: "some updated long_url", short_url: 43}
    @invalid_attrs %{long_url: nil, short_url: nil}

    def url_fixture(attrs \\ %{}) do
      {:ok, url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Urls.create_url()

      url
    end

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Urls.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Urls.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      assert {:ok, %Url{} = url} = Urls.create_url(@valid_attrs)
      assert url.long_url == "some long_url"
      assert url.short_url == 42
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Urls.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      assert {:ok, %Url{} = url} = Urls.update_url(url, @update_attrs)
      assert url.long_url == "some updated long_url"
      assert url.short_url == 43
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Urls.update_url(url, @invalid_attrs)
      assert url == Urls.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Urls.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Urls.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Urls.change_url(url)
    end
  end
end
