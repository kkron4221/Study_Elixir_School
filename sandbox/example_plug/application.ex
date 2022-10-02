defmodule ExamplePlug.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: ExamplePlug.HelloWorldPlug, options: [port: 8080]}
    ]
    opts = [strategy: :one_for_one, name: ExamplePlug.Supervisor]

    Logger.info("Starting appilication...")

    Supervisor.start_link(children, opts)
  end
end
