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


      def hello do
        IO.puts "hello()"
      end


    end
  end

end


defmodule Main do
  use YstFoundationOfTheUniverse


  def main do
    IO.puts inspect @html_elems ++ @html_elems_link ++ @checks_list
    hello()
  end

end


Main.main()
