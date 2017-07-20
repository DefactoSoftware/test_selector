defmodule TestSelector.Test.HelpersTest do
  use ExUnit.Case
  use Hound.Helpers
  alias TestSelector.Support.UserView
  import TestSelector.Test.Helpers

  hound_session()

  test "find the avatar text using find_test_element/2" do
    navigate_to "http://localhost:9090/index.html"
    assert find_test_element(UserView, "avatar") |> inner_text() == "avatar"
  end

  test "find a specific user using find_test_element/3" do
    navigate_to "http://localhost:9090/index.html"
    assert find_test_element(UserView, "user-list-item", 6) |> inner_text() =~ "right user"
  end

  test "search for the avatar element using search_test_element/2" do
    navigate_to "http://localhost:9090/index.html"
    assert {:ok, %Hound.Element{}} = search_test_element(UserView, "avatar")
  end

  test "search for specific user element using search_test_element/3" do
    navigate_to "http://localhost:9090/index.html"
    assert {:ok, %Hound.Element{}} = search_test_element(UserView, "user-list-item", 6)
  end

  test "search for an element that does not exist using search_test_element/2" do
    navigate_to "http://localhost:9090/index.html"
    assert search_test_element(UserView, "does-not-exist") == {:error, :no_such_element}
  end

  test "get element test value using element_test_value/1" do
    navigate_to "http://localhost:9090/index.html"
    assert find_element(:class, "foo")
           |> element_test_value() == "bar"
  end

  test "test element test value using element_test_value?/2" do
    navigate_to "http://localhost:9090/index.html"
    assert find_element(:class, "foo")
           |> element_test_value?("bar")
  end
end
