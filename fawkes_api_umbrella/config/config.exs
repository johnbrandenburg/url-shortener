# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :fawkes_api,
  ecto_repos: [FawkesApi.Repo]

config :fawkes_api_web,
  ecto_repos: [FawkesApi.Repo],
  generators: [context_app: :fawkes_api]

# Configures the endpoint
config :fawkes_api_web, FawkesApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "A+JVVVOc92T3vi4guxYKUrnnPaDtzridY4LQcc7+X0rEWpUgXy6/EiuiMCPFZs+i",
  render_errors: [view: FawkesApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: FawkesApiWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "SK+Jzp4s"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
