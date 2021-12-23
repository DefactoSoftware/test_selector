defmodule TestSelector.HTML.HelpersTest do
  use ExUnit.Case
  alias TestSelector.Support.UserView

  test "#test_selector/0 from two different modules should not be the same" do
    assert UserView.test_selector() != TestSelector.Support.Extra.UserView.test_selector()
    assert UserView.test_selector() =~ ~s(user)
  end

  test "#test_selector/1" do
    assert UserView.test_selector("avatar") == UserView.test_selector("avatar")

    assert UserView.test_selector("avatar") !=
             TestSelector.Support.Extra.UserView.test_selector("avatar")

    assert UserView.test_selector("avatar") =~ ~s(user)
    assert UserView.test_selector("avatar") =~ ~s(avatar)
  end

  test "#test/0 returns a test selector" do
    assert {:safe, "test-selector=\"user-8f9ba\""} = UserView.test()
  end

  test "#test/1 returns a test selector by name" do
    assert {:safe, "test-selector=\"user-8f9ba-foo\""} = UserView.test("foo")
  end

  test "#test/2 returns a test selector by name and value" do
    assert {:safe, "test-selector=\"user-8f9ba-foo\" test-value=\"bar\""} =
             UserView.test("foo", "bar")
  end
end
