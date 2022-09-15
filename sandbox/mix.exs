defmodule Sandbox.MixProject do
  use Mix.Project

  def project do
    [
      app: :sandbox,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

  # defmodule ExampleApp.CLI do
  #   def main(_args \\ []) do

  #   end
  # end

  defmodule ExampleApp.Mixproject do
    def project do
      [app: :example_app, version: "0.0.1", escript: escript()]
    end

    defp escript do
      [main_module: ExampleApp.CLI]
    end
  end

  defmodule ExampleApp.CLI do
    def main(args \\ []) do
      args
      |> parse_args
      |> response
      |> IO.puts()
    end

    defp parse_args(args) do
      {opts, word, _} =
        args
        |> OptionParser.parse(switches: [upcase: :boolean])
      {opts, List.to_string(word)}
    end

    defp response({opts, word}) do
      if opts[:upcase], do: String.upcase(word), else: word
    end
  end


  # Process Monitoring
  # defmodule Example do
  #   def explode, do: exit(:kaboom)

  #   def run do
  #     {pid, ref} = spawn_monitor(Example, :explode, [])

  #     receive do
  #       {:DOWN, _ref, :process, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")
  #     end
  #   end
  # end

  # Task
  defmodule Example do
    def double(x) do
      :timer.sleep(2000)
      x * 2
    end
  end


  # # GenServer
  # defmodule SimpleQueue do
  #   use GenServer

  #   @doc """
  #   キューを開始し、リンクします。
  #   これはヘルパー関数です。
  #   """

  #   def start_link(state \\ []) do
  #     GenServer.start_link(__MODULE__, state, neme: __MODULE__)
  #   end

  #   @doc """
  #   GenServer.init/1コールバック
  #   """

  #   def init(state), do: {:ok, state}
  # end

  defmodule SimpleQueue do
    use GenServer

    ### GenServer API

    @doc """
    GenServer.init/1コールバック
    """
    def init(state), do: {:ok, state}

    @doc """
    GenServer.handle_call/3コールバック
    """

    def handle_call(:dequeue, __from, [value | state]) do
      {:reply, value, state}
    end

    def handle_call(:dequeue, __from, []), do: {:reply, nil, []}

    def handle_call(:queue, _from, state), do: {:reply, state, state}

    ### クライアント側API / ヘルパー関数

    def start_link(state \\ []) do
      GenServer.start_link(__MODULE__, state, name: __MODULE__)
    end

    def queue, do: GenServer.call(__MODULE__, :queue)
    def dequeue, do: GenServer.call(__MODULE__, :dequeue)
  end
