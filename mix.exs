defmodule Phorn.MixProject do
  use Mix.Project

  def project do
    [
      app: :phorn,
      version: "0.1.4",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
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
    ]
  end

  defp package() do
    [
      description:  "Algorithmic fake word generator",
      licenses: [ "GPL-3.0-only" ],
      links: %{"GitHub" => "https://github.com/carltonbrown/phorn"}
    ]
  end
end
