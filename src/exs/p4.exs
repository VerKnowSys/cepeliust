defmodule Functionz do

  # Only Elixir allows definition of pattern matched functions like these:
  # NOTE: order of defintion matters! (cause order of pattern matching)
  def fun1 "abc" do
    "abc"
  end

  def fun1 other do
    other
  end

end


defmodule Main do
  import Functionz


  def main do

    # "regular" functions:
    # NOTE: operator notation:
    IO.puts fun1 "abc"
    IO.puts fun1 "other"

    # anonymous functions:
    fun3 = fn argument when is_number(argument) -> argument + 1 end
    fun_in_fun = fn -> fun3.(1) + 1 end

    # lazy evaluation
    IO.puts inspect {fun3, fun_in_fun} # lazy, no invocation, tuple of functions
    # eager evaluation
    IO.puts inspect fun_in_fun.() # eager - invoke function
    IO.puts inspect fun3.(5) # eager - invoke function

    IO.puts "Passing fun3 as argument for fun1()"
    IO.puts inspect fun1 fun3 # lazy evaluation and partial application, since we pass function as a value (without invoking the function!)

    # more lazy evaluation:
    result = [1,2,3,4,5,6,7,8,9]
      |> Stream.drop(2) # skip first 2 values,
      |> Stream.take(5) # take 5 next values,
      |> Stream.filter(fn element -> rem(element, 2) == 1 end) # filter odd values
      |> Stream.map(fn element -> element * 2 end) # let's pretend this map is some "heavy processing"…
    IO.puts inspect result # still lazy, hence it's #Stream<…> - no invocation at all, so no processing at all!

    other_required_state = true # simulate situation when something doesn't have to be processed at all if other conditions aren't satisfied - this way you can simply discard whole lazy processing.. which can significantly improve performance
    if other_required_state do
      eager_result = result |> Enum.to_list() # Enum.to_list() evaluates eagerly, (any Enum operation does) then
      IO.puts inspect eager_result # print expected values: [6, 10, 14]
    end
  end

end


Main.main()
