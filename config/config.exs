# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :orders,
  ecto_repos: [Orders.Repo]

# Configures the endpoint
config :orders, OrdersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "In9F61c/rKFTEVWgoDihNmNmDUpxmIvFTJxnv6suJtxslYZY7/xkK5a8/ZmRtdqy",
  render_errors: [view: OrdersWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Orders.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :orders, Orders.Repo,
  username: "postgres",  # change thebrianemory to the name of your home directory
  password: "",
  database: "orders_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
