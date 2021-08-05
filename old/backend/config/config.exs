# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :spelling_game,
  ecto_repos: [SpellingGame.Repo]

# Configures the endpoint
config :spelling_game, SpellingGameWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "i51CJjuK2l0QpSb+IU5vzA/IdZpG5hrJZTUFMbHLNkVS5jmFMg0EA0jmRM1QRbWy",
  render_errors: [view: SpellingGameWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: SpellingGame.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
