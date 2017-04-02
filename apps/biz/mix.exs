defmodule Biz.Mixfile do
  use Mix.Project

  def project do
    [app: :biz,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.4.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: applications(Mix.env),
     mod: {Biz, []}]
  end

  defp applications(_), do: [:logger, :ecto, :postgrex]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:mix_test_watch, github: "aforward/mix-test.watch", only: :dev, runtime: false},
     {:ex_doc, "~> 0.14", only: :dev},
     {:ecto, "~> 2.1.3"},
     {:postgrex, ">= 0.13.0"},
     {:slugger, "~> 0.1.0"}]
  end

end
