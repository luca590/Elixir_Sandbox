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

    def do_equality do
        IO.puts "4 == 4.0: #{4 == 4.0}"     # True - Comparing values but not data types
        IO.puts "4 === 4.0: #{4 === 4.0}"   # False - Comparing values and data types
        IO.puts "4 != 4.0: #{4 != 4.0}"     # False
        IO.puts "4 !== 4.0: #{4 !== 4.0}" # True
        IO.puts "true and not true : #{true and (not true)}"  # and could be replace with or
    end

    def do_decision_making do
        age = 16

        if age > 18 do
          IO.puts "Can vote"
        else
          IO.puts "Cannot vote"
        end 

        unless age === 18 do    # execute code unless...
          IO.puts "You are not 18"
        else
          IO.puts "You are 18"
        end

        cond do   #conditinal statement, similar to switch-case
          age >= 18 -> IO.puts "age >= 18"
          age >= 16 -> IO.puts "age >= 16"
          age >= 14 -> IO.puts "age >= 14"
          true -> IO.puts "Age is < 14"   #default value
        end
            
    end

    def case_statements do
      my_variable = 100

      case 2 do #can also put variable inside of case instead of 2
        1 -> IO.puts "In case, variable is 1"
        2 -> IO.puts "In case, variable is 2"
        _-> IO.puts "Default case"
      end

      #Ternary operator
      IO.puts "#{if my_variable > 50, do: "variable greater than 50", else: "variable not > 50"}"

    end  

    def pipe_me do
      4 * 10 |> IO.puts   # can also pipe values to functions in Elixir
    end

    def do_tuple_stuff do
      my_tuple = {:thing1, :thing2, 5}

      IO.puts "Is this is a tuple? #{is_tuple(my_tuple)}" 

      my_tuple2 = Tuple.append(my_tuple, 6.6)  #need to create a new variable, all variables in elixir are constant
      IO.puts "Get 1st index my_tuple2[1]: #{elem(my_tuple2, 3)}" #3rd index, not 3rd element
      IO.puts "Tuple size is: #{tuple_size(my_tuple2)}"

      my_tuple3 = Tuple.delete_at(my_tuple2, 2)   # Delete 2nd index, need to create new variable
      my_tuple3 = Tuple.insert_at(my_tuple2, 2, :new_atom)   # Delete 2nd index, need to create new variable
      tuple_with_5_zeros = Tuple.duplicate(0,5)

      {color, dim1, dim2} = {:blue, 9, 10}  # Pattern matchine!!

      IO.puts "Color in tuple is: #{color}"
    end  

    def do_list_stuff do  #similar syntax to arrays, but behave slightly differently
      list1 = [1,2,3]
      list2 = [4,5,6]

      list_of_words = ["This", "is", "my", "list"]

      IO.puts "list1 ++ list2: #{list1 ++ list2}"
      IO.puts "list1 -- list2: #{list1 -- list2}"

      IO.puts 5 in list2  # is 5 in list2?

      [head | tail] = list1 ++ list2  # the head is 1st element (index 0) and the tail is everything else
      IO.puts "head is: #{head}"

      IO.write "Tail is: "  # IO.write does not print \n at end of line
      IO.inspect tail       # Be careful with using IO.inspect, may need to specify type IO.inspect [98,99], char_lists: : as_lists

      Enum.each tail, fn some_item ->
        IO.puts some_item
      end

      Enum.each list_of_words, fn word -> 
        IO.puts word
      end

#    def display_list(my_list) do
#      Enum.each my_list, thing_in_list
#    end


    end


end













