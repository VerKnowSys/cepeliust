#!/usr/bin/make

.DEFAULT_GOAL := build_all


build_p1:
	clang -o bin/p1a src/cpp/p1a.cpp
	clang -o bin/p1b src/cpp/p1b.cpp
	rustc -o bin/p1 src/rs/p1.rs


build_p2:
	rustc -o bin/p2 src/rs/p2.rs

build_p3:
	rustc -o bin/p3a src/rs/p3a.rs
	rustc -o bin/p3b src/rs/p3b.rs

build_p4:
	rustc -o bin/p4 src/rs/p4.rs

build_all:
	mkdir bin
	make -s build_p1
	make -s build_p2
	make -s build_p3
	make -s build_p4


run_all:
	clear
	printf "\n\n\n%s\n--------------------\n\n" "C++ Point 1a:"
		bin/p1a
	printf "\n\n\n%s\n--------------------\n\n" "C++ Point 1b:"
		bin/p1b
	printf "\n\n\n%s\n--------------------\n\n" "Elixir Point 1:"
		elixirc -o bin/p1_ex src/exs/p1.exs
	printf "\n\n\n%s\n--------------------\n\n" "Rust Point 1:"
		bin/p1

	echo
	read -s _tmp
	clear

	printf "\n\n\n%s\n--------------------\n\n" "Elixir Point 2:"
		elixirc -o bin/p2_ex src/exs/p2.exs
	printf "\n\n\n%s\n--------------------\n\n" "Rust Point 2:"
		bin/p2

	echo
	read -s _tmp
	clear

	printf "\n\n\n%s\n--------------------\n\n" "Elixir Point 3:"
		elixirc -o bin/p3_ex src/exs/p3.exs
	printf "\n\n\n%s\n--------------------\n\n" "Rust Point 3a:"
		bin/p3a
	printf "\n\n\n%s\n--------------------\n\n" "Rust Point 3b:"
		bin/p3b

	echo
	read -s _tmp
	clear

	printf "\n\n\n%s\n--------------------\n\n" "Elixir Point 4:"
		elixirc -o bin/p4_ex src/exs/p4.exs
	printf "\n\n\n%s\n--------------------\n\n" "Rust Point 4:"
		bin/p4

	echo
	echo "That's all folks!"
	read -s _tmp

run:
	make -s run_all

clean:
	rm -fr bin


list:
	make -s list_p1_cpp
	make -s list_p1_exs
	make -s list_p1_rs

	make -s list_p2_exs
	make -s list_p2_rs

	make -s list_p3_exs
	make -s list_p3_rs

	make -s list_p4_exs
	make -s list_p4_rs


list_p1_cpp:
	bat src/cpp/p1a.cpp src/cpp/p1b.cpp
list_p1_exs:
	bat src/exs/p1.exs
list_p1_rs:
	bat src/rs/p1.rs

list_p2_exs:
	bat src/exs/p2.exs
list_p2_rs:
	bat src/rs/p2.rs

list_p3_exs:
	bat src/exs/p3.exs
list_p3_rs:
	bat src/rs/p3a.rs src/rs/p3b.rs

list_p4_exs:
	bat src/exs/p4.exs
list_p4_rs:
	bat src/rs/p4.rs

