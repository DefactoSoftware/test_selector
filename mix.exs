defmodule TestSelector.Mixfile do
  use Mix.Project

  def project do
    [
      app: :test_selector,
      version: "0.3.1",
      elixir: "~> 1.4",
      description: "Library to help selecting the right elements in your tests",
      test_coverage: [tool: ExCoveralls],
      dialyzer: [plt_add_apps: [:mix, :ex_unit], check_plt: true],
      build_embedded: Mix.env() == :test,
      start_permanent: Mix.env() == :test,
      package: package(),
      deps: deps()
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
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false},
      {:floki, "~> 0.25"},
      {:hound, "~> 1.0"},
      {:phoenix_html, "~> 2.6"}
    ]
  end

  defp package do
    [
      maintainers: ["Matthijs Kuiper", "Marcel Horlings"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/DefactoSoftware/test_selector",
        "Docs" => "http://hexdocs.pm/test_selector/"
      }
    ]
  end
end
