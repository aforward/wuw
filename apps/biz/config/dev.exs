use Mix.Config

config :biz, Biz.Repo, [
  adapter: Ecto.Adapters.Postgres,
  database: "wuw_#{Mix.env}",
  username: "postgres",
  password: "",
  hostname: "localhost",
]