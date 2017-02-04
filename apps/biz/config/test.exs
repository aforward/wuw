use Mix.Config

config :biz, Biz.Repo, [
  adapter: Ecto.Adapters.Postgres,
  database: "wuw_#{Mix.env}",
  username: "postgres",
  password: "",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox]

config :logger,
  backends: [:console],
  level: :warn,
  compile_time_purge_level: :info