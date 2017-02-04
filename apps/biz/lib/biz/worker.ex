defmodule Biz.Worker do
  use GenServer

  ### Public API

  def start_link, do: {:ok, _pid} = GenServer.start_link(__MODULE__, [], name: __MODULE__)

  def ping, do: GenServer.call(Biz.Worker, :ping)

  ### Server Callbacks

  def init(_) do
    {:ok, zero_state}
  end

  def handle_call(:ping, _from, state) do
    {:reply, :pong, state}
  end

  defp zero_state, do: :ok

end
