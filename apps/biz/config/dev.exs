use Mix.Config

config :biz, Biz.Repo, [
  adapter: Ecto.Adapters.Postgres,
  database: "wuw_#{Mix.env}",
  username: "postgres",
  password: "",
  hostname: "localhost",
]

config :mix_test_watch,
  setup_tasks: [
    "ecto.drop --quiet",
    "ecto.create --quiet",
    "ecto.migrate",
  ],
  ansi_enabled: :ignore,
  clear: true
