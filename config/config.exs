# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :music_box,
  ecto_repos: [MusicBox.Repo]

# Configures the endpoint
config :music_box, MusicBoxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Xp6GU/KjPP8x82AFMkYMDYFr2+kaZvYFtMfRu7+JkWW1GvLOTY5pztb7Sd7XhQeK",
  render_errors: [view: MusicBoxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MusicBox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
