# Cep-Eli-(R)ust

Cepeliust is a set of examples written for fun in Elixir and Rust. Main idea is to use them to easily explain "[Functional Programming Paradigm](https://en.wikipedia.org/wiki/Functional_programming)" basic principles for hardcore imperative programmers. Code is organized in "Points". First "Point" is one with additional C++ imperative coding examples for comparison purposes. :)


### Author:

Daniel (dmilith) Dettlaff


### Requirements:

* Darwin 15.6.0+ or other NIX system or Linux
* Clang 6.0+
* Elixir 1.6+
* Rust 1.28+ (https://rustup.rs/)


### Additional requirements:

* bat `cargo install bat`
* make 4.x+
* cmake 3.x+


## Points description:

### Point 1:

    * Immutability by default, generic and reusable code - how to stop thinking like CPU (imperatively)
    * No variables (with exception of hybrid languages like: Scala or Rust) - sounds scary, it's not
    * Data structures and data types - idea of cheap abstractions that allow work on "human friendly abstraction and data level"
    * Recurssion and Tail recurssion - No loops (kinda)

### Point 2:

    * Increasing level of abstraction with more concise code
    * Principles of Pattern matching - how to control the flow efficiently, elegantly and _exhaustively_
    * State in FP

### Point 3:

    * Atoms (holds no value, aren't garbage collected, aren't pointers, are shared) - kinda like tags
    * Monads (Option, Result/ Maybe, Either, …) flow control and processing chain - theory looks like "a dragon", but in practice it's natural and rather obvious

### Point 4:

    * Function as first class citizen, Function application, lazy evaluation, operator notation, anonymous functions, partial application - a lot of scary words around really simple ideas

### Point 5:
    * Quotting, unquotting - macros in action. Code that writes code. Metaprogramming.
    * Data driven development, Default values, human level of the code logic abstraction. (Elixir example Yst?)



## How to run it:

* `make clean`
* `make`
* `make run`



## Additional command examples:

* `make list_p1_cpp` -  Code listing for Point 1 code of C++
* `make list_p2_rs`  -  Code listing for Point 2 code of Rust
* `make list_p4_exs` -  Code listing for Point 4 code of Elixir



### License:

MIT/BSD/IDGAF
