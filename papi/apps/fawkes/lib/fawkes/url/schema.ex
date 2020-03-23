defmodule Fawkes.Url.Schema do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "urls" do
    field :long_url, :string
    field :short_url, :integer

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:short_url, :long_url])
    |> validate_required([:short_url, :long_url])
    |> unique_constraint(:short_url)
  end

  @doc false
  def generate_short_url() do
    <<short_url_hex::binary-size(3), _::binary>> = Ecto.UUID.bingenerate()

    {short_url, ""} = short_url_hex
    |> Base.encode16()
    |> Integer.parse(16)

    short_url
  end
end
