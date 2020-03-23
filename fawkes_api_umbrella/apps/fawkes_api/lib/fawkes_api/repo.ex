defmodule FawkesApi.Repo do
  use Ecto.Repo,
    otp_app: :fawkes_api,
    adapter: Ecto.Adapters.Postgres
end
