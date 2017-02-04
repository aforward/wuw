defmodule WuwWeb.Mixfile do
  use Mix.Project

  def project do
    [app: :wuw_web,
     version: "0.0.1",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.2",
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

  defp applications(:dev), do: applications(:all) ++ [:mix_test_watch]
  defp applications(:test), do: applications(:dev)
  defp applications(_), do: [:logger, :cowboy, :ecto, :postgrex, :biz]

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_ecto, "~> 3.2.1"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:mix_test_watch, "~> 0.3", only: [:dev, :test]},
     {:ex_doc, "~> 0.14", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:ecto, "~> 2.1.3"},
     {:postgrex, ">= 0.13.0"},
     {:biz, in_umbrella: true}]
  end
end
