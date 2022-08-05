defmodule SimpleStream.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_stream,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      description: description(),
      deps: deps(),
      package: package()
    ]
  end

  defp description do
    """
    Simple stream provides a simple multiconsumer read-only partitioned stream service with pluggable backends.
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["Chris Ertel"],
      licenses: ["Public Domain (unlicense)", "WTFPL", "New BSD"],
      links: %{"GitHub" => "https://github.com/crertel/simple_stream"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6.6", only: :dev, runtime: false},
      {:dialyxir, "~> 1.2.0", only: [:dev], runtime: false}
    ]
  end
end
