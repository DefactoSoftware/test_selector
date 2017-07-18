defmodule TestSelector.Support.UserView do
  use TestSelector.HTMLHelpers
end

defmodule TestSelector.Support.Extra.UserView do
  use TestSelector.HTMLHelpers
end

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
