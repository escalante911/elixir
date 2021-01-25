# Integers
n= 102
n_hex = 0x41 # = 65
n_octal = 0o24 # = 20

IO.puts("a= #{n}, b = #{n_hex}, c= #{n_octal}")

q = div(35,4) #8
r = rem(35,4) #3

# Float
x = 2.71
IO.puts("round(#{x}) #{round(x)"})
IO.puts("trunc(#{x}) #{round(x)"})

x = 246.5e-2
IO.puts("round(#{x}) #{round(x)"})
IO.puts("trunc(#{x}) #{round(x)"})

# Booleans
isOpen = true # false
t = true
f = false
IO.puts("-----------------------------")
IO.puts("#{f} and #{f} = #{f and f}")
IO.puts("#{f} and #{t} = #{f and t}")
IO.puts("#{t} and #{f} = #{t and f}")
IO.puts("#{t} and #{f} = #{t and t}")

x = 2.71
isOpen = true # false
text = "Hello world (#{isOpen})"
list = [1, "hola", 2.3, false]
tuple = {1, "2", 3.0}
atom = my_atom
atom2= MyAtom

a = 2
b = 1.5
IO.puts("is_float(#{a}) = #{is_float(a)}")
IO.puts("is_float(#{b}) = #{is_float(b)}")
IO.puts("is_integer(#{a}) = #{is_integer(a)}")
IO.puts("is_integer(#{b}) = #{is_integer(b)}")
IO.puts("is_number(#{a}) = #{is_number(a)}")
IO.puts("is_number(#{b}) = #{is_number(b)}")

IO.puts("==============================")
text = "Pingüino"
IO.puts(text)
IO.puts(is_binary(\"#{text}\") = #{is_binary(text)}")















