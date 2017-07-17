defmodule TestSelector.HTMLHelpers do
  @moduledoc """
  Documentation for TestSelector.
  """

  alias Phoenix.HTML

  defmacro __using__(_options) do
    quote do
      import TestSelector.HTMLHelpers

      def test_selector do
        __MODULE__
        |> Module.split()
        |> [List.last(modules)]
        |> Enum.join("-")
        |> String.trim_trailing("View")
        |> String.trim_trailing("Cell")
        |> String.downcase()
        |> Kernel.<>("-#{test_hash()}")
      end
      def test_selector(name) do
        test_selector()
        |> Kernel.<>("-#{name}")
      end

      def test do
        test_selector()
        |> test_attributes()
      end
      def test(name, value \\ nil) do
        name
        |> test_selector()
        |> test_attributes(value)
      end

      defoverridable [
        test_selector: 0,
        test_selector: 1
      ]
    end
  end

  def test_hash do
    :md5
    |> :crypto.hash("#{__MODULE__}")
    |> Base.encode16(case: :lower)
    |> String.slice(0, 5)
  end

  def test_attributes(selector) do
    output_attributes(HTML.raw(~s(test-selector="#{selector}")))
  end
  def test_attributes(selector, nil), do: test_attributes(selector)
  def test_attributes(selector, value) do
    output_attributes(HTML.raw(~s(test-selector="#{selector}" test-value="#{value}")))
  end
  defp output_attributes(attributes) do
    case Mix.env do
      :prod -> ""
      _ -> attributes
    end
  end
end
