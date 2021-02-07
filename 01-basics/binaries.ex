string = "Hello"
io.puts is_binary(true) #true

IO.puts ?@ #64
IO puts ?@ == 64 # true
IO puts ?@ == 0x40 # true

IO.puts "\u0061" # "a"
IO.puts "\u0061" == "a" # true
IO.puts "\u0061" === "a" # true

##################################
string = "Pingüino"
IO.puts String.lenght(string) # 8
IO.puts byte_size(string) # 9

###################################
#7 6 5 4 3 2 1 0
#a b c d e f g h = a * 2^7 + b * 2^6 + ....+ f * 2^2 g * 2 h
#0 0 0 0 0 0 0 0
#1 1 1 1 1 1 1 1

255 = 0b1111_1111
256 = 0b1_0000_0000
1024 = 0b100_0000_0000

IO.puts <<256::8>> == <<0::8>> # true
IO.puts <<8>> == <<0::8>> # true

IO.puts <<256::16>> = <<1, 0>> # true
IO.puts <<256::16>> = <<1::8, 0::8>> # true

IO.puts <<64>> === "Q" # true

IO.puts <<4:4, 0::4>> === "Q" # true

IO.puts <<1::1, 0::1, 1::1, 1::1>> === <<11::4>>



Enum.map([1,2,3,4,5], &(3 * & 1 + 1))
Enum.reduce([1, 3, 4, -1])
list = [1,2,3,4,5]
triple_plus_one = Enum.map(list, &(3 * &1 + 1))
Enum.filter(triple_plus_one, &(rem (&1, 2 == 0))
