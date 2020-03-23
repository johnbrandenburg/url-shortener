defmodule Fawkes.Url do
  @moduledoc """
  The Url context.
  """

  import Ecto.Query, warn: false
  alias Fawkes.Repo
  alias Fawkes.Url.Schema

  @doc """
  Gets a single url.

  Raises `Ecto.NoResultsError` if the Url does not exist.

  ## Examples

      iex> get_url!(123)
      %Url{}

      iex> get_url!(456)
      ** (Ecto.NoResultsError)

  """
  def get_url!(id), do: Repo.get!(Schema, id)

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
