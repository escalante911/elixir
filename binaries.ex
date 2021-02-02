string = "Hello"
io.puts is_binary(true) #true

IO.puts ?@ #64
IO puts ?@ == 64 # true
IO puts ?@ == 0x40 # true

IO.puts "\u0061" # "a"
IO.puts "\u0061" == "a" # true
IO.puts "\u0061" === "a" # true

##################################

Enum.map([1,2,3,4,5], &(3 * & 1 + 1))
Enum.reduce([1, 3, 4, -1])
list = [1,2,3,4,5]
triple_plus_one = Enum.map(list, &(3 * &1 + 1))
Enum.filter(triple_plus_one, &(rem (&1, 2 == 0))
