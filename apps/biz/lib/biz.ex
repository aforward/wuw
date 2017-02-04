defmodule Biz do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: Biz.Worker.start_link(arg1, arg2, arg3)
      worker(Biz.Worker, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Biz.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defdelegate ping, to: Biz.Worker

end