defmodule TestSelector.Test.HoundHelpers do
  @moduledoc """
  Helpers to find `test-selector` elements in HTML using Hound.
  """
  use Hound.Helpers

  @doc """
  Finds element by test selector on current page.

  Returns an element that can be used with other element functions.
  """
  def find_test_element(view_module) do
    {:safe, test_selector} = view_module.test()
    find_element(:xpath, ~s|#{xpath_pattern(test_selector)}|)
  end

  def find_test_element(view_module, selector) do
    {:safe, test_selector} = view_module.test(selector)
    find_element(:xpath, ~s|#{xpath_pattern(test_selector)}|)
  end

  def find_test_element(view_module, selector, value) do
    {:safe, test_selector} = view_module.test(selector)
    find_element(:xpath, ~s|#{xpath_pattern(test_selector, value)}|)
  end

  @doc """
  Same as `find_test_element`, but returns the a tuple with `{:error, error}`
  instead of raising.
  """
  def search_test_element(view_module) do
    {:safe, test_selector} = view_module.test()
    search_element(:xpath, ~s|#{xpath_pattern(test_selector)}|)
  end

  def search_test_element(view_module, selector) do
    {:safe, test_selector} = view_module.test(selector)
    search_element(:xpath, ~s|#{xpath_pattern(test_selector)}|)
  end

  def search_test_element(view_module, selector, value) do
    {:safe, test_selector} = view_module.test(selector)
    search_element(:xpath, ~s|#{xpath_pattern(test_selector, value)}|)
  end

  @doc """
  Get an element `test-value` attribute.

  Returns `nil` then the `test-value` attribute is not found.
  """
  def element_test_value(%Hound.Element{} = element) do
    attribute_value(element, "test-value")
  end

  @doc """
  Check if the element `test-value` attribute matches the given value.

  * Returns `true` if the value matches.
  * Returns `false` if the value does not match or is not found.
  """
  def element_test_value?(%Hound.Element{} = element, value) do
    element_test_value(element) == to_string(value)
  end

  # Get test attributes xpath pattern
  defp xpath_pattern(selector), do: "//*[@#{selector}]"
  defp xpath_pattern(selector, nil), do: xpath_pattern(selector)

  defp xpath_pattern(selector, value) do
    xpath_pattern(selector) <> "[@test-value=\"#{value}\"]"
  end
end
