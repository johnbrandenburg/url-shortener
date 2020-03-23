# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :fawkes,
  ecto_repos: [Fawkes.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :fawkes, FawkesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XfW9pMklLy6oB78rzeHL2Gq2WzE8g637//SmpEHfGBflOFp5u2ba0iPHNCmqYBNU",
  render_errors: [view: FawkesWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Fawkes.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "HCfTyLYP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
