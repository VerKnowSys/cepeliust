defmodule Structure do
  defstruct [
    index: Integer,
    value: String,
  ]
end


defmodule Main do

  # This is Elixir specific method overloading using pattern match (yes, it's lovely)
  def add_string("", ""), do: "Nothing!"
  def add_string(a, b) when is_binary(a) and is_binary(b), do: a <> " " <> b <> "\n"
  def add_string(a, b) when is_number(a) and is_number(b) do
    "#{a} + #{b} = #{ a+b }"
  end


  def main do
    IO.puts add_string("", "")
    IO.puts add_string(1, 2)
    IO.puts add_string("ale", "fajnie")

    some_value = 10
    10 = some_value # it's valid since "=" is not "assign" but "pattern match"

    magic_value = 11
    # 10 = magic_value # ERROR since no match between values

    # handling pattern match (valid for single value)
    if 11 = magic_value do
      IO.puts "Got match: 11!"
    end

    if 11 == magic_value do
      IO.puts "Not match but value comparison: 11!"
    end

    # handling pattern match (elegant way):
    case magic_value do
      10 -> IO.puts "Impossible!"
      11 -> IO.puts "Match!"
      e when e > 20 -> IO.puts "Too big too furious!"
      _  -> IO.puts "No match!"
    end

    case 21 do
      10 -> IO.puts "Impossible!"
      11 -> IO.puts "Match!"
      e when e > 20 -> IO.puts "Too big too furious!"
      _  -> IO.puts "No match!"
    end

    tuple2 = {10, "abc"} # tuple is a pair here, but also can be tripple, quadruple, …
    # only single case, any other case will be no-op!
    if {_, "abc"} = tuple2 do
      IO.puts "Any first value, but second pair element is 'abc'!"
    end

    # all possible cases, no possibility of getting something unexpected
    case tuple2 do
      {1, ""} -> IO.puts "No match"
      {10, value} -> IO.puts "It's 10 and I got value, which is: #{value}"
      {_, _} -> IO.puts "Any pair match"
      _ -> IO.puts "Anything!"
    end

    case :abstract_value_that_makes_no_sense do
      {1, ""} -> IO.puts "No match"
      {10, value} -> IO.puts "It's 10 and I got value, which is: #{value}"
      {_, _} -> IO.puts "Any pair match"
      named_value -> IO.puts "Got ambiguous value: #{inspect named_value}!"
    end

    # example for map:
    map = %{index: 1, value: "Anyvalue"}
    # example with structure - under the hood it's just named Map hence it's similar to %{}
    structure = %Structure{
      index: 123,
      value: "Stefan",
    }
    case structure do
      %Structure{index: index, value: value} -> IO.puts "Got structure with index: #{index} and value: #{value}"
      struct when is_map(map) -> IO.puts "map is a map, and structure is: #{inspect struct}" # is also valid but first match is ok so this will never be invoked
      _any -> IO.puts "No match"
    end

    case structure do
      struct when is_map(map) -> IO.puts "map is a map, and structure is: #{inspect struct}"
      %Structure{index: index, value: value} -> IO.puts "Got structure with index: #{index} and value: #{value}"
      _ -> {} # return anything for no match
    end
  end

end

Main.main()
