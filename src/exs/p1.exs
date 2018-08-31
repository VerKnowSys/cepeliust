defmodule Operations do


  # Sums all numbers in given range
  def sumall(of) when is_number(of) do
    if of > 0 do
      of + sumall(of - 1)
    else
      0
    end
  end


  # Counts factorial of given number
  def factorial(of) when is_number(of) do
    cond do
      of > 1 ->
        of * factorial(of - 1)
      of <= 1 ->
        1
    end
  end


end


defmodule Main do


  def main do
    import Operations

    # of = 9
    of = 10
    sum_of = sumall of
    factorial_of = factorial of

    # 1st call:
    IO.puts "Elixir: #{ of }! = #{ factorial_of }, sumall = #{ sum_of }"

    # Nth call:
    IO.puts "Elixir: 0! = #{ factorial(0) }, sumall = #{ sumall(0) }"
  end


end


Main.main()
