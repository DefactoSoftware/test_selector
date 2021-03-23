[![Hex.pm](https://img.shields.io/hexpm/v/test_selector.svg)](https://hex.pm/packages/test_selector)
[![CircleCI](https://circleci.com/gh/DefactoSoftware/test_selector/tree/master.svg?style=shield)](https://circleci.com/gh/DefactoSoftware/test_selector)

# TestSelector

A set of Elixir and [Hound](https://github.com/HashNuke/hound) helpers to set/get test selectors to/from elements in a Phoenix app (when `Mix.env == :test`). These selectors are hashed (scoped to the view module they are used in) for accurate selection and "leakage" prevention. See our [Wiki](https://github.com/DefactoSoftware/test_selector/wiki) for examples.

**Why?** Because we prefer reserving classes for styling, and id's have limitations because they have to be unique.

## Dependencies

- [Hound](https://github.com/HashNuke/hound) v1.x.x
- [Floki](https://github.com/philss/floki) v0.25.x and higher

## Installation

```elixir
def deps do
  [{:test_selector, "~> 0.3.2"}]
end
```

Use `TestSelector.HTML.Helpers` to your web.ex.

- In phoenix 1.2.0 at `web/web.ex`
- In newer Phoenix versions `lib/your_project/web/web.ex`

Add somewhere along:

```elixir
  def view(opts \\ []) do
    quote do
      ...
      use Phoenix.HTML

      use TestSelector.HTML.Helpers
      ...
    end
  end
```

**Testing with Floki**

In the tests import the `TestSelector.Test.HoundHelpers` :

```elixir
defmodule Project.Web.MyTest do
  ...
  use Hound.Helpers

  import TestSelector.Test.FlokiHelpers
  ...
end
```

**Testing with Hound**

In the tests import the `TestSelector.Test.HoundHelpers`

```elixir
defmodule Project.Web.MyTest do
  ...
  use Hound.Helpers

  import TestSelector.Test.HoundHelpers
  ...
end
```

## Tests

To run tests you need to install [PhantomJS](http://phantomjs.org/).
```
brew install phantomjs
```

Run the webdriver:
```
phantomjs -w
```

Run the tests:
```
mix test
```
