# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rocinante,
  ecto_repos: [Rocinante.Repo]

# Configures the endpoint
config :rocinante, RocinanteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nEZkPOLOsuu68DHbNoFByxoHKTrkjUT/5Lrzge2QbkgvcOsCrcbsnweFhiWILvia",
  render_errors: [view: RocinanteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rocinante.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Thesis Main Config
config :thesis,
  store: Thesis.EctoStore,
  authorization: Rocinante.ThesisAuth,
  uploader: Thesis.RepoUploader

# Thesis Store Config
config :thesis, Thesis.EctoStore, repo: Rocinante.Repo

# Thesis Notifications Config
# config :thesis, :notifications,
#   add_page: [],
#   page_settings: [],
#   import_export_restore: []

# Thesis Dynamic Pages Config
# config :thesis, :dynamic_pages,
#   view: RocinanteWeb.PageView,
#   templates: ["index.html", "otherview.html"],
#   not_found_view: RocinanteWeb.ErrorView,
#   not_found_template: "404.html"

