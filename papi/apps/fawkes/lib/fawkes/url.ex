defmodule Fawkes.Url do
  @moduledoc """
  The Url context.
  """

  import Ecto.Query, warn: false
  alias Fawkes.Repo
  alias Fawkes.Url.Schema

  @doc false

  def get_url_by_short_url(short_url) do
    Repo.get_by(Schema, short_url: short_url)
  end

  @doc """
  Creates a url.

  ## Examples

      iex> create_url(%{field: value})
      {:ok, %Url{}}

      iex> create_url(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_url(attrs \\ %{}) do
    %Schema{short_url: Schema.generate_short_url()}
    |> Schema.changeset(attrs)
    |> Repo.insert()
  end
end
