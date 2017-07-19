defmodule TestSelector.Mixfile do
  use Mix.Project

  def project do
    [app: :test_selector,
     version: "0.1.0",
     elixir: "~> 1.4",
     description: "Library to help selecting the right elements in test",
     build_embedded: Mix.env == :test,
     start_permanent: Mix.env == :test,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:hound, "~> 1.0"},
      {:phoenix_html, "~> 2.6"}
    ]
  end

  defp package do
    [
      maintainers: ["Matthijs Kuiper", "Marcel Horlings"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/HashNuke/hound"
      }
    ]
  end
end
