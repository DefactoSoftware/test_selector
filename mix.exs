defmodule TestSelector.Mixfile do
  use Mix.Project

  def project do
    [
      app: :test_selector,
      version: "0.2.1",
      elixir: "~> 1.4",
      description: "Library to help selecting the right elements in your tests",
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
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false},
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
