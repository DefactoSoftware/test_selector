defmodule TestSelector.TestHelpers do
  @moduledoc """
  Test Helpers
  """
  use Hound.Helpers

  def find_test_element(view_or_cell) do
    {:safe, test_selector} = view_or_cell.test()
    find_element(:xpath, ~s|//*[@#{test_selector}]|)
  end

  def find_test_element(view_or_cell, name) do
    {:safe, test_selector} = view_or_cell.test(name)
    find_element(:xpath, ~s|//*[@#{test_selector}]|)
  end

  def find_test_element(view_or_cell, name, value) do
    {:safe, test_selector} = view_or_cell.test(name)
    find_element(:xpath, ~s|//*[@#{test_selector}][@test-value="#{value}"]|)
  end

  def test_element_value(%Hound.Element{} = element) do
    attribute_value(element, "test-value")
  end

  def test_element_value?(%Hound.Element{} = element, value) do
    test_element_value(element) == to_string(value)
  end
end
