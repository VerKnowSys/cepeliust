defmodule Structure do
  # Example structure of two fields that:
  # are enforced to be defined.

  @enforce_keys [
    :index,
    :value,
  ]

  defstruct [
    index: Integer,
    value: String,
  ]

end


defmodule Main do


  # This is Elixir specific method overloading using pattern match (yes, it's lovely)
  def add_string("", ""), do: "Nothing!"
  def add_string(a, b) when is_binary(a) and is_binary(b), do: a <> " " <> b <> "\n"
  #                               manual method of String formatting 👆
  def add_string(a, b) when is_number(a) and is_number(b) do
    "#{a} + #{b} = #{ a+b }"
  #           👆 second method of String formatting
  end


  def main do
    IO.puts add_string "", "" # sometimes parentheses can be omitted for function calls,
    IO.puts add_string 1, 2   # allowing "operator notation" elements :) fancy-Haskell-ish!
    IO.puts add_string("something", "nice")

    magic_value = 11 # this is syntax "sugar lie" :). Elixir knows there's nothing like "magic_value",
                     # uptil now, so it assigns it with value on the right side of the match.
    # NOTE: 10 = magic_value # would throw runtime ERROR since no match between values!

    some_value = 10
    10 = some_value # NOTE: it's valid since "=" is not "assign" but "pattern match" in Elixir!

    # handling pattern match (valid for single value)
    if 11 = magic_value do
      IO.puts "Got match: 11!"
    end

    if 11 == magic_value do
      IO.puts "Not match but value comparison: 11!"
    end

    # handling pattern match (elegant way):
    case magic_value do
      10 ->
        IO.puts "Impossible!"
      11 ->
        IO.puts "Match!"
      e when e > 20 ->
        IO.puts "Too big too furious!"
      _  ->
        IO.puts "No match!"
    end

    case 21 do
      10 ->
        IO.puts "Impossible!"
      11 ->
        IO.puts "Match!"
      e when e > 20 ->
        IO.puts "Too big too furious!"
      _  ->
        IO.puts "No match!"
    end

    tuple2 = {10, "abc"} # tuple is a pair here, but also can be tripple, quadruple, …
    # only single case, any other case will be no-op!
    if {_, "abc"} = tuple2 do # pattern matching condition
      IO.puts "Any first value, but second pair element is 'abc'!"
    end

    # all possible cases, no possibility of getting something unexpected
    case tuple2 do
      {1, ""} ->
        IO.puts "No match"
      {10, value} ->
        IO.puts "It's 10 and I got value, which is: #{value}"
      {_, _} ->
        IO.puts "Any pair match"
      _ ->
        IO.puts "Anything!"
    end

    case :abstract_value_that_makes_no_sense do
      {1, ""} ->
        IO.puts "No match"
      {10, value} ->
        IO.puts "It's 10 and I got value, which is: #{value}"
      {_, _} ->
        IO.puts "Any pair match"
      named_value ->
        IO.puts "Got ambiguous value: #{inspect named_value}!"
    end

    # example for map:
    a_map = %{index: 1, value: "Anyvalue"}
    a_structure = %Structure{
      index: 123,
      value: "Stefan",
    }
    # 👆 structures in Elixir under the hood are simply a named Map: %{}
    case a_structure do
      %Structure{index: index, value: value} -> # pattern matching on the structure values
        IO.puts "Got structure with index: #{index} and the value is: #{value}"
      anyvalue when is_map(a_map) and is_map(anyvalue) -> # value type guard of matched object "struct"
        # 👆 case is also valid but since first match passes here, this code will never be invoked
        IO.puts "Both 'a_map' and 'anyvalue' are maps! (requirement), and the value is: #{inspect anyvalue}"
      _any ->
        IO.puts "No match"
    end

    case a_structure do
      anyvalue when is_map(a_map) and is_map(anyvalue) ->
        IO.puts "Both 'a_map' and 'anyvalue' are maps! (requirement), and the value is: #{inspect anyvalue}"
      %Structure{index: index, value: value} -> # pattern matching on the structure values
        IO.puts "Got structure with index: #{index} and value is: #{value}"
      _ ->
        :no_match # return atom ":no_match" for all other value types,
                  # that "structure" can be (since it's dynamic typed language)
    end
  end


end


Main.main()
