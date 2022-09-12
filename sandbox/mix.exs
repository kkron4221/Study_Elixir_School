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

  defmodule ExampleApp.CLI do
    def main(args \\ []) do

    end
  end

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
