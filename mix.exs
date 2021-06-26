defmodule TestSelector.Mixfile do
  use Mix.Project

  @source_url "https://github.com/DefactoSoftware/test_selector"
  @version "0.3.2"

  def project do
    [
      app: :test_selector,
      version: @version,
      elixir: "~> 1.4",
      test_coverage: [tool: ExCoveralls],
      dialyzer: [plt_add_apps: [:mix, :ex_unit], check_plt: true],
      build_embedded: Mix.env() == :test,
      start_permanent: Mix.env() == :test,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 1.2", only: [:dev, :test], runtime: false},
      {:dialyxir, "1.0.0-rc.7", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.7", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:floki, "~> 0.25"},
      {:hound, "~> 1.0"},
      {:phoenix_html, "~> 2.6"}
    ]
  end

  defp package do
    [
      description: "Library to help selecting the right elements in your tests",
      maintainers: ["Matthijs Kuiper", "Marcel Horlings"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      formatters: ["html"]
    ]
  end
end
