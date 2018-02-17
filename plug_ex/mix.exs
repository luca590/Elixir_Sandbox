#https://www.youtube.com/watch?v=F4oAZx_ao4s&list=PLJbE2Yu2zumAgKjSPyFtvYjP5LqgzafQq&index=5

defmodule PlugEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_ex,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :plug, :cowboy],
      mod: {PlugEx, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.0"},     #router, recieve and return connections
      {:cowboy, "~> 1.0.0"}   #server
    ]
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
  end
end
