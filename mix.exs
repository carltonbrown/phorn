defmodule Phorn.MixProject do
  use Mix.Project

  def project do
    [
      app: :phorn,
      version: "0.1.0",
      elixir: "~> 1.8",
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
      {:number, "~> 1.0.0"},
      {:exprof, "~> 0.2.3"},
    ]
  end
end
