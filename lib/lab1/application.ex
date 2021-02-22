defmodule Lab1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      %{
        id: Worker0,
        start: {Worker, :start_link, [0]}
      },

      %{
        id: Worker1,
        start: {Worker, :start_link, [1]}
      },

      %{
        id: Worker2,
        start: {Worker, :start_link, [2]}
      },

      %{
        id: Worker3,
        start: {Worker, :start_link, [3]}
      },

      %{
        id: Router,
        start: {Router, :start_link, []}
      },

      %{
        id: Connection,
        start: {Connection, :connect, []}
      }
      
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options

    # Connection.connect()
    
    opts = [strategy: :one_for_one, name: Lab1.Supervisor, max_restarts: 999]
    Supervisor.start_link(children, opts)

  end
end
