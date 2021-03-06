defmodule WuwWeb.Mixfile do
  use Mix.Project

  def project do
    [app: :wuw_web,
     version: "0.0.1",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.4.1",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [applications: applications(Mix.env),
     mod: {WuwWeb, []}]
  end

  defp applications(_), do: [:logger, :cowboy, :ecto, :postgrex, :biz]

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.0-rc"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_ecto, "~> 3.2.1"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:mix_test_watch, github: "aforward/mix-test.watch", only: :dev, runtime: false},
     {:ex_doc, "~> 0.14", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:ecto, "~> 2.1.3"},
     {:postgrex, ">= 0.13.0"},
     {:number, "~> 0.5.1"},
     {:biz, in_umbrella: true}]
  end
end
