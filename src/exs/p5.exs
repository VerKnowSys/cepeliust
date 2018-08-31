defmodule YstFoundationOfTheUniverse do
  @moduledoc """
  Core defines set of functions and features
  to be injected to any module, cause… why not!
  """


  defmacro __using__(_opts) do
    quote do


      @checks_list [
        :title?, :title_not?, :text?, :text_not?,
        :src?, :src_not?, :frame?, :frame_not?,
        :script?, :script_not?, :id?, :id_not?,
        :css?, :css_not?, :class?, :class_not?,
        :tag?, :tag_not?, :name?, :name_not?,
        :cookie?, :cookie_not?
      ]

      @html_elems_link [
        :partial_link_text,
        :link_text
      ]

      @html_elems [
        :xpath,
        :name,
        :class,
        :id,
        :css,
        :tag,
      ]


      def hello(), do: "I'm injected function hello(), called by module: #{__MODULE__}!"
      def hello(value), do: "I'm injected function hello(#{value}), called by module: #{__MODULE__}!"


    end
  end


end


defmodule Main do
  use YstFoundationOfTheUniverse


  def main do
    # call injected function first
    hello()

    keys = @html_elems ++ @html_elems_link ++ @checks_list

    # Elixir is one of the sweetest languages for sure! ;)
    #
    # NOTE: Expressions 1…5 below are just clever syntatic sugar,
    # they all perform _exactly_ _the_ _same_ _operation_,

    IO.puts "Five identical outputs:"

    # 1:
    keys |> inspect |> IO.puts

    # 2.
    (inspect keys)
      |> IO.puts

    # 3:
    IO.puts inspect keys

    # 4:
    IO.puts(inspect(keys))

    # 5:
    (IO.puts (inspect keys))


    # Let's go deeper with Elixir quote/ unquote mechanism!
    IO.puts "\n\nQuote me anytime where you need me!"

    # Elixir code quoting feature (which is core part of Elixir macros system)
    quoted_code_block = quote do
      post_function = fn ->
        IO.puts "Runtime: quoted_code_block().post_function(). Finished!"
      end
      IO.puts "Runtime: Inner invoke hello(): " <> unquote(hello()) <>
              "Runtime: Inner invoke hello(999): " <> unquote(hello(999))
      post_function.()
    end

    # below, another example showing yet another notation
    # available for Elixir 'oneliners' like one below:
    _quoted_keys = quote do: unquote(keys) # NOTE: with 'do:' one-liner
                                           # we skip the "end"

    IO.puts "\nQuoted inspected keys: " <> inspect(
      quote do
        unquote(keys |> inspect())
      end
    )
    IO.puts "\nQuoted inspected keys String with replaced content: " <> inspect(
      quote do
        unquote(
          keys
            |> inspect()
            |> String.replace([":", ",", " "], "_")
        )
      end
    )

    # Code quotation converts Elixir syntax to BEAM AST (Tuple) form:
    quotted_block = quote do
      unquote(IO.puts("Precompile 'msg_1', from: hello(5551)!"))
      IO.puts("Runtime 'msg_1', from: hello(5551)!")
      unquote(hello(5551)) # trick of unquoting value in quoted macro allows
                       # to pass/ inject/ inspect code of function
                       # in representation used internally by BEAM VM.

      unquote(IO.puts("Precompile 'msg_2', from: hello()!"))
      IO.puts("Runtime 'msg_2', from: hello()!")
      unquote(hello()) # trick of unquoting value in quoted macro allows
                       # to pass/ inject/ inspect code of function
                       # in representation used internally by BEAM VM.
    end
    IO.puts "\nQuoted block: " <> inspect quotted_block

    # λ(code_block):
    anon_fun_that_accepts_code_block_as_arg = fn a_block ->
      IO.puts "Runtime: Evaluating: anon_fun_that_accepts_code_block_as_arg()"
      a_block
        |> Macro.to_string()
        |> Code.eval_string()
      IO.puts "Runtime: Completed: anon_fun_that_accepts_code_block_as_arg()"
    end

    # "Apply" #1:
    anon_fun_that_accepts_code_block_as_arg.(quotted_block)

    # Quoted λ:
    code_block = quote do
      fn ->
        unquote(quoted_code_block)
        :happy_atom # in all functions, last expression
                    # is value returned by function
      end
    end
    # "Apply" #2:
    anon_fun_that_accepts_code_block_as_arg.(code_block)

    # invoke quoted function and parse String:
    stringified_block = code_block |> Macro.to_string()

    IO.puts "\n\n\nCODE BLOCK: #{stringified_block}"
    IO.puts "\nCODE BLOCK (AST): #{inspect code_block}"

    # since our closure is quoted, we have to invoke it this way:
    invoke_inner_function = quote do unquote(code_block).() end

    # now, the invoke_inner_function is function that should return :happy_atom
    evaluated = invoke_inner_function |> Macro.to_string() |> Code.eval_string()
    IO.puts "\nCODE BLOCK EVALUATED: #{inspect evaluated}\n\n"

    lazy_function = fn ->
      quote do
        # NOTE: since macros are invoked _before_ the compilation stage,
        #       with quote/unquote, we can inject code into AST,
        #       before project gets compiled! This is how macros work in Elixir
        IO.puts "Runtime: Before code block eval!"
        stringified_block |> Code.eval_string()
        IO.puts "Runtime: After code block eval!"
      end
    end

    function_as_value = quote do
      IO.puts "Runtime: function_as_value()"
      unquote(lazy_function.()) # it has to be unquotted since we need to
                                # inject lazy_function before project compile time
    end

    block_returned_as_string = function_as_value |> Macro.to_string()
    IO.puts "\n\nReturned lambda block: '#{block_returned_as_string}'"
    IO.puts "\nReturned lambda block (BEAM AST representation): '#{inspect function_as_value}'"

  end


end


Main.main()
