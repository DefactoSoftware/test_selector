defmodule TestSelector.HTMLHelpersTest do
  use ExUnit.Case
  alias TestSelector.Support.Extra.UserView

  test "#test_selector/0 from two different modules should not be the same" do
    assert UserView.test_selector() != TestSelector.Support.UserView.test_selector()
    assert UserView.test_selector() =~ ~s(user)
  end

  test "#test_selector/1" do
    assert UserView.test_selector("avatar") == UserView.test_selector("avatar")
    assert UserView.test_selector("avatar") != TestSelector.Support.UserView.test_selector("avatar")
    assert UserView.test_selector("avatar") =~ ~s(user)
    assert UserView.test_selector("avatar") =~ ~s(avatar)
  end
end

defmodule TestSelector.HelpersTest do
  use ExUnit.Case
  use Hound.Helpers

  alias TestSelector.Support.UserView
  import TestSelector.Test.Helpers

  hound_session()

  test "find a specific user with find_test_element/3" do
    navigate_to "http://localhost:9090/index.html"

    assert find_test_element(UserView, "user-list-item", "6") |> inner_text() =~ "right user"
  end

  test "find the avatar text with find_test_element/2" do
    navigate_to "http://localhost:9090/index.html"

    assert find_test_element(UserView, "avatar") |> inner_text() == "avatar"
  end
end
