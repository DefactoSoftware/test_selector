defmodule TestSelector.FlokiHelpersTest do
  use ExUnit.Case

  import TestSelector.Test.FlokiHelpers

  doctest TestSelector.Test.FlokiHelpers, import: true

  describe "#find_test_selectors/2" do
    test "raises an error when the conn is given as first argument" do
      assert_raise(
        RuntimeError,
        "use html_response/2 to supply the html to find_test_selectors",
        fn -> find_test_selectors(%Plug.Conn{}, "selector") end
      )
    end
  end

  describe "#find_test_selectors/3" do
    test "raises an error when the conn is given as first argument" do
      assert_raise(
        RuntimeError,
        "use html_response/2 to supply the html to find_test_selectors",
        fn -> find_test_selectors(%Plug.Conn{}, "selector", "value") end
      )
    end
  end

  describe "#find_test_selector/2" do
    test "raises an error when the conn is given as first argument" do
      assert_raise(
        RuntimeError,
        "use html_response/2 to supply the html to find_test_selector",
        fn -> find_test_selector(%Plug.Conn{}, "selector") end
      )
    end
  end

  describe "#find_test_selector/3" do
    test "raises an error when the conn is given as first argument" do
      assert_raise(
        RuntimeError,
        "use html_response/2 to supply the html to find_test_selector",
        fn -> find_test_selector(%Plug.Conn{}, "selector", "value") end
      )
    end
  end
end
