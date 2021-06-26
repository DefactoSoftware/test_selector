defmodule TestSelector.Test.FlokiHelpers do
  @moduledoc """
  Helpers to find `test-selector` elements in HTML using Floki.
  """

  @doc """
  Returns a list of elements by a given `test-selector` inside a string or HTML tree.

  It will raise with an error if a conn is supplied as first argument.

  ## Examples

      iex> text = ~S(<a test-selector="hello" test-value="world"></a><a test-selector="foo" test-value="bar"></a>)
      iex> find_test_selectors(text, "hello")
      [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}]

      iex> tree = [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}, {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]
      iex> find_test_selectors(tree, "foo")
      [{"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]

      iex> text = ~S(<a test-selector="hello" test-value="world"></a>)
      iex> find_test_selectors(text, "foo")
      []

  """
  @spec find_test_selectors(String.t() | Floki.html_tree(), String.t()) :: Floki.html_tree()
  def find_test_selectors(%Plug.Conn{}, _),
    do: raise("use html_response/2 to supply the html to find_test_selectors")

  def find_test_selectors(string, selector) when is_binary(string),
    do: string |> Floki.parse_fragment!() |> find_test_selectors(selector)

  def find_test_selectors(html_tree, selector),
    do: Floki.find(html_tree, "[test-selector=#{selector}]")

  @doc """
  Returns a list of elements by a given `test-selector` and `test-value` inside
  a string or HTML tree.

  It will raise with an error if a conn is supplied as first argument.

  ## Examples

      iex> text = ~S(<a test-selector="hello" test-value="world"></a><a test-selector="foo" test-value="bar"></a>)
      iex> find_test_selectors(text, "hello", "world")
      [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}]

      iex> tree = [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}, {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]
      iex> find_test_selectors(tree, "foo", "bar")
      [{"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]

      iex> text = ~S(<a test-selector="hello" test-value="world"></a>)
      iex> find_test_selectors(text, "hello", "bar")
      []

  """
  @spec find_test_selectors(String.t() | Floki.html_tree(), String.t(), String.t()) ::
          Floki.html_tree()

  def find_test_selectors(%Plug.Conn{}, _, _),
    do: raise("use html_response/2 to supply the html to find_test_selectors")

  def find_test_selectors(input, selector, value),
    do: input |> find_test_selectors(selector) |> find_test_values(value)

  @doc """
  Same as `find_test_selectors/2`, but instead of returning a list of elements only
  the first elements is returned.

  It will raise with an error if a conn is supplied as first argument.

  ## Examples

      iex> text = ~S(<a test-selector="hello" test-value="world"></a><a test-selector="foo" test-value="bar"></a>)
      iex> find_test_selector(text, "hello")
      {"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}

      iex> tree = [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}, {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]
      iex> find_test_selector(tree, "foo")
      {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}

      iex> text = ~S(<a test-selector="hello" test-value="world"></a>)
      iex> find_test_selector(text, "foo")
      nil

  """
  @spec find_test_selector(String.t() | Floki.html_tree(), String.t()) :: Floki.html_tree() | nil
  def find_test_selector(%Plug.Conn{}, _),
    do: raise("use html_response/2 to supply the html to find_test_selector")

  def find_test_selector(input, selector),
    do: input |> find_test_selectors(selector) |> List.first()

  @doc """
  Same as `find_test_selectors/3`, but instead of returning a list of elements only
  the first elements is returned.

  It will raise with an error if a conn is supplied as first argument.

  ## Examples

      iex> text = ~S(<a test-selector="hello" test-value="world"></a><a test-selector="foo" test-value="bar"></a>)
      iex> find_test_selector(text, "hello", "world")
      {"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}

      iex> tree = [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}, {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]
      iex> find_test_selector(tree, "foo", "bar")
      {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}

      iex> text = ~S(<a test-selector="hello" test-value="world"></a>)
      iex> find_test_selector(text, "hello", "bar")
      nil

  """
  @spec find_test_selector(String.t() | Floki.html_tree(), String.t(), String.t()) ::
          Floki.html_tree() | nil

  def find_test_selector(%Plug.Conn{}, _, _),
    do: raise("use html_response/2 to supply the html to find_test_selector")

  def find_test_selector(input, selector, value),
    do: input |> find_test_selectors(selector, value) |> List.first()

  @doc """
  Returns a list of test values from given elements.

  ## Examples

      iex> text = ~S(<a test-selector="hello" test-value="world"></a><a test-selector="foo" test-value="bar"></a>)
      iex> find_test_values(text)
      ["world", "bar"]

      iex> tree = [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}, {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]
      iex> find_test_values(tree)
      ["world", "bar"]

  """
  @spec find_test_values(String.t() | Floki.html_tree()) :: list()
  def find_test_values(string) when is_binary(string),
    do: string |> Floki.parse_fragment!() |> find_test_values()

  def find_test_values(html_tree), do: Floki.attribute(html_tree, "test-value")

  @doc """
  Returns a list of elements inside a string or HTML tree.

  ## Examples

      iex> text = ~S(<a test-selector="hello" test-value="world"></a><a test-selector="foo" test-value="bar"></a>)
      iex> find_test_values(text, "bar")
      [{"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]

      iex> tree = [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}, {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]
      iex> find_test_values(tree, "world")
      [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}]

  """
  @spec find_test_values(String.t() | Floki.html_tree(), String.t()) :: Floki.html_tree()
  def find_test_values(string, value) when is_binary(string),
    do: string |> Floki.parse_fragment!() |> find_test_values(value)

  def find_test_values(html_tree, value), do: Floki.find(html_tree, "[test-value=#{value}]")

  @doc """
  Same as `find_test_values/2`, but instead of returning a list of elements only
  the first elements is returned.

  ## Examples

      iex> text = ~S(<a test-selector="hello" test-value="world"></a><a test-selector="foo" test-value="bar"></a>)
      iex> find_test_value(text, "bar")
      {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}

      iex> tree = [{"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}, {"a", [{"test-selector", "foo"}, {"test-value", "bar"}], []}]
      iex> find_test_value(tree, "world")
      {"a", [{"test-selector", "hello"}, {"test-value", "world"}], []}

  """
  @spec find_test_value(String.t() | Floki.html_tree(), String.t()) :: Floki.html_tree()
  def find_test_value(input, value),
    do: input |> find_test_values(value) |> List.first()
end
