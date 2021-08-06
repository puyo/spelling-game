# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :spell,
  ecto_repos: [Spell.Repo]

# Configures the endpoint
config :spell, SpellWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cWeab9D9tn9xSWFHiea6TK4O1lwmLk6+OzqJnlWCmKITq2RqgO78n7IrwHa4yg+s",
  render_errors: [view: SpellWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Spell.PubSub,
  live_view: [signing_salt: "qRKR9x3J"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
