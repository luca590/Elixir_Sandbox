#This tutorial is taken from Derek Banas: https://www.youtube.com/watch?v=pBNOavRoNL0
#Also, cool vim plugin for Elixir here: https://github.com/elixir-editors/vim-elixir

defmodule M do
	def main do
# get the user's name and get rid of new line
		name = IO.gets("What is your name? ") |> String.trim	
		IO.puts "Hello #{name}"	#output the information - insert name in the output string

		#New function
		data_stuff()
	end
	
	def data_stuff do
		my_int = 123
		IO.puts "Integer #{is_integer(my_int)}" 	#No max integer size
		IO.puts "Atom #{is_atom(:Atom)}" 	#No max integer size
		one_to_10 = 1..10
	end

	def do_string_stuff do
		my_str = "Hello World"
		IO.puts "Length is: #{String.length(my_str)}"
        longer_str = my_str <> " " <> "is longer"   # use <> to concatinate strings
        IO.puts "Equal: #{"Egg" === "egg"}"    # === checks if both value and type are true

        IO.puts "Does Hello World Contain Hello? #{String.contains?(my_str, "Hello")}"
        IO.puts "Character at index 4 is: #{String.at(my_str, 4)}"  # Indexing strings, can use String.slice to get substring

        IO.inspect String.split(longer_str, " ")    #inspect prints internal representation of value
        #split a string, longer_str using " " as delimiter
        #String also has reverse, upcase, downcase (lower case), and capitalize (first character)
	end

    def pipe_me do
      4 * 10 |> IO.puts   # can also pipe values to functions in Elixir
    end

end
