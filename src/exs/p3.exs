# Taken from Yst project written by me last year

# Elixir lacks monadic processing in std lib,
# but we can implement our own not-very-useful Option monad:


defmodule None do
  @moduledoc """
  Option None
  """
  @type t :: None.t

  defstruct [:v, :vtype]


  def v do
    %None{}
  end


end


defmodule Some do
  @moduledoc """
  Option Some
  """
  require Logger

  @type t :: Some.t

  @enforce_keys [:v, :vtype]
  defstruct [:v, :vtype]


  # This example also shows pattern matching
  @spec v :: (Some.t | None.t)
  def v, do: None.v
  def v(nil), do: None.v
  def v(<<>>), do: None.v
  def v([]), do: None.v
  def v({}), do: None.v
  def v(%{}), do: None.v
  def v(%Some{}), do: None.v
  def v input do
    in_type = typeof input
    %Some{
      v: input,
      vtype: in_type,
    }
  end


  @spec unwrap(some :: Some.t) :: any
  def unwrap some do
    try do
      %Some{v: value} = some
      value
    rescue
      MatchError ->
        some

      _ ->
        some
    end
  end


  @spec unwrap_or_else(some :: Some.t, elseblock :: Some.t) :: any
  def unwrap_or_else some, elseblock do
    try do
      %Some{v: value} = some
      value
    rescue
      _ ->
        case elseblock do
          %Some{v: value, vtype: _} -> value
          val -> val
        end
    end
  end


  # Trick to get type of value in dynamic language.. all dynamic languages have their own "dragons", this is how it's done for Elixir (Erlang)
  types = ~w[boolean number function nil integer binary bitstring list map float atom tuple pid port reference]

  for type <- types do

    # NOTE: This code runs immediately compile time! It's kinda like "a safe feature injection" mechanism!

    # This is a macro that defines functions for each type from "types" (let's not dig too deep into macros for now)
    def typeof(x) when unquote(:"is_#{type}")(x), do: unquote(type)

  end

  IO.puts("___ Compile Time Message ___")


end


defmodule Main do


  def main do
    # Kinda hacky and magic, and not much gain here to be honest,
    # except the fact that we're not using 'nil' at all here

    value = Some.v Keyword.new [some: "more", time: "for"]
    %Some{v: [some: "more", time: "for"], vtype: "list"} = value

    value2 = Some.v 2345
    %Some{v: 2345, vtype: "number"} = value2

    value3 = Some.v "some binary" # it's "binary" since Erlang has no real String value - 'values' is list of chars.
    %Some{v: "some binary", vtype: "binary"} = value3

    %None{} = Some.unwrap(Some.v())
    12_345 = Some.unwrap(Some.v(12_345))

    value_wrong = [even: "now"] # a Keyword type
    1 = value_wrong |> Some.unwrap_or_else(1)
    3 = {:anything, :else} |> Some.unwrap_or_else(3) # {:anything, :else} - tuple of "atoms"
    {:anything, :else} = Some.v({:anything, :else}) |> Some.unwrap_or_else(3)
    [some: "more", time: "for"] = value |> Some.unwrap()
    [some: "more", time: "for"] = value |> (Some.unwrap_or_else :NOWAI)

    atoms = [:an_atom, :more_atomz, :dadada] # list of atoms. As simple as that

    # eagerly convert list of atoms to strings and join by comma:
    joined = atoms
              |> Enum.map(fn atom -> Atom.to_string(atom) end) # eagerly map each element (atom here) and convert it to String
              |> Enum.join(", ")

    # equivalent step by step:
    joined_p1 = Enum.map(atoms, fn atom -> Atom.to_string(atom) end)
    joined_p2 = Enum.join(joined_p1, ", ")
    IO.puts "Joined: #{joined}\nBoth exactly the same? #{joined == joined_p2}"

    IO.puts "All matches passed as expected"
  end


end


Main.main()
