# "Why λ-calculus is so sexy" and why we should care.


0. "Basic" and "Common" or language agnostic principles:

  * KISS (Keep It Simple Stupid)
  * DRY (Don't Repeat Yourself)
  * Coding on highest possible level of abstraction (best: human thinking level).
  * Don't go too deep into the rabbit hole (low level knowledge is useful but not required)


1. Functions, Monads, Pattern Matching and the "FP zoo" - switching the mindset

  * Immutability by default - how to stop thinking like CPU (imperatively)
  * No variables (with exception of hybrid languages like: Scala or Rust) - sounds scary, it's not
  * Pattern matching - how to control the flow efficiently and elegantly
  * Monads (Option, Result/ Maybe, Either, …) - theory looks like "a dragon", but in practice it's not scary at all
  * Atoms (atom holds no value, isn't garbage collected, isn't pointer and usually shared globally per runtime) - kinda like tags (also present in Ruby, called "symbols" there)
  * Function as first class citizen, Function application, Operator Notation, anonymous functions, Partial Application - a lot of scary words
  * Data structures and data types - Ideas of cheap abstractions that allow work on "human friendly abstraction and data level"
  * Recurssion and Tail recurssion - No loops. Passing "state" as function argument
  * Syntax sugar - Bitter lies, sweet lies!
  * Following the "code hygiene" principles - You _can_ write _bad_ code in _any_ language :)


2. Eager vs Lazy

  * Lazy evaluation, Lazy data processing - Real world scenarios.
  * Enum/ List/ Vec vs Stream/ Slice. Eager vs Lazy.


3. Strong vs Weak

  * Advantages and Disadvantages of strong typing - Simple facts.
  * Compile time error vs Runtime error.


4. Go with the flow

  * Broken ideas of NULL, nullptr, null, nil, Nil and monsters alike.
  * |> operator and Option/Result monads for chaining of evaluation
  * Managing the state in immutable world.
  * Common λ functions map(), fold(), reject(), …


5. Code that writes code

  * Macros (compile time code injection).
  * Quoting, Unquoting, Serialization and Deserialization.


6. λ-similarities between data driven languages

  * Structures (as data holders)
  * Protocols, Behaviours, Traits

