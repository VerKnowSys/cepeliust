#!/usr/bin/make -f

.DEFAULT_GOAL := all

run_p1:
	clang -o ./p1a src/cpp/p1a.cpp && ./p1a
	clang -o ./p1b src/cpp/p1b.cpp && ./p1b
	elixir src/exs/p1.exs
	rustc src/rs/p1.rs && ./p1

run_p2:
	elixir src/exs/p2.exs
	rustc src/rs/p2.rs && ./p2

run_p3:
	elixir src/exs/p3.exs
	rustc src/rs/p3a.rs && ./p3a
	rustc src/rs/p3b.rs && ./p3b

run_p4:
	elixir src/exs/p4.exs
	rustc src/rs/p4.rs && ./p4

clean:
	rm -f ./p*

all:
	printf "\n\n\n%s\n\n" "Point 1"
	make -s run_p1
	printf "\n\n\n%s\n\n" "Point 2"
	make -s run_p2
	printf "\n\n\n%s\n\n" "Point 3"
	make -s run_p3
	printf "\n\n\n%s\n\n" "Point 4"
	make -s run_p4
