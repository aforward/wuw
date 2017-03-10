# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :wuw_web, WuwWeb.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mZq3REPFaX5ONqqobsUcrV2FdmhbeDqk3n3h7Vq2bF6Ifg0wqYB6Io4Z6uKzp6/C",
  render_errors: [view: WuwWeb.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WuwWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
