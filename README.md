# TestSelector

This is an testselector that can be used with Phoenix and [Hound](https://github.com/HashNuke/hound).


## Installation

```elixir
def deps do
  [{:test_selector, "~> 0.0.1"}]
end
```

Add TestSelector.HTMLHelpers to your web.ex
- In phoenix 1.2.0 at `web/web.ex`
- In phoenix 1.3.0 at `lib/your_project/web/web.ex`

Add somewhere along:
```elixir
  def view(opts \\ []) do
    quote do
      ...

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      use TestSelector.HTMLHelpers

      ...
    end
  end
```

in the tests use the `TestSelector.TestHelpers`

```elixir
defmodule Project.Web.MyTestWithTestHelpers do
  ...
  use Hound.Helpers

  import TestSelector.TestHelpers
  ...
end
```


