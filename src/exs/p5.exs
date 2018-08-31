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

    # Elixir code quoting feature (which is part of Elixir macros system)
    quoted_code_block = quote do
      post_function = fn ->
        IO.puts "I was invoked right after quotted code block!"
      end

      IO.puts "Inner invoke hello(): " <> unquote(hello()) <>
              "Inner invoke hello(999): " <> unquote(hello(999))

      post_function.()
    end

    # below, another example showing yet another notation
    # available for Elixir 'oneliners' like one below:
    _quoted_keys = quote do: unquote(keys) # NOTE: with 'do:' one-liner
                                           # we skip the "end"

     IO.puts "\nQuoted inspected keys: " <> inspect(quote do
       unquote(keys |> inspect())
     end)
     IO.puts "\nQuoted inspected keys String with replaced content: " <> inspect(quote do
       unquote(keys |> inspect() |> String.replace([":", ",", " "], "_"))
     end)


    IO.puts "\nQuotted block: " <> inspect(quote do
      unquote(IO.puts("Msg_1 from: hello(5551)!"))
      unquote(hello(5551)) # trick of unquoting value in quotted macro allows
                       # to pass/ inject/ inspect code of function
                       # in representation used internally by BEAM VM.

      unquote(IO.puts("Msg_2 from: hello()!"))
      unquote(hello()) # trick of unquoting value in quotted macro allows
                       # to pass/ inject/ inspect code of function
                       # in representation used internally by BEAM VM.
    end)

    block = quote do
      unquote(quoted_code_block)
    end
    stringified_block = block |> Macro.to_string()
    IO.puts "\nQuotted 'keys' converted to String: #{stringified_block}"

    lazy_function = quote do
      unquote(IO.puts "Lazy function: Evaluating block: #{stringified_block}")
      unquote(Code.eval_string(stringified_block))
      IO.puts "Lazy function: Done!"
    end

    function_as_value = quote do
      unquote(lazy_function).() # it has to be unquotted since lazy_function
                                # exists only compile time, hence it will be
                                # invoked  only compile time!
    end

    IO.puts "\nFunction evaled from 'stringified_block': " <>
      inspect function_as_value
  end


end


Main.main()
