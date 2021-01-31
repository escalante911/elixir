# Integer
n = 102
n_hex = 0x41 # = 65
n_octal = 0o24 # = 20

IO.puts("a = #{n}, b = #{n_hex}, c =#{n_octal}")

q = div(35, 4) # 8
r = rem(35, 4) # 3

# Float
x = 2.71
IO.puts("round(#{x}) = #{round(x)}")
IO.puts("trunc(#{x}) = #{trunc(x)}")

x = 276.5e-2
IO.puts("round(#{x}) = #{round(x)}")
IO.puts("trunc(#{x}) = #{trunc(x)}")

# Booleans
isOpen = true # false
t = true
f = false

IO.puts("AND table")
IO.puts("#{f} and #{f} = #{f and f}")
IO.puts("#{f} and #{t} = #{f and t}")
IO.puts("#{t} and #{f} = #{t and f}")
IO.puts("#{t} and #{t} = #{t and t}")
IO.puts("--------------------------")
IO.puts("OR table")
IO.puts("#{f} or #{f} = #{f or f}")
IO.puts("#{f} or #{t} = #{f or t}")
IO.puts("#{t} or #{f} = #{t or f}")
IO.puts("#{t} or #{t} = #{t or t}")
IO.puts("--------------------------")
IO.puts("NOT table")
IO.puts("not #{f} = #{not f}")
IO.puts("not #{t} = #{not t}")
IO.puts("--------------------------")
IO.puts("is_boolean(#{t}) = #{is_boolean(t)}")
IO.puts("is_boolean(#{f}) = #{is_boolean(f)}")
IO.puts("is_boolean(#{f}) = #{is_boolean(1.2)}")
IO.puts("--------------------------")
a = 2
b = 1.5
IO.puts("is_float(#{a}) = #{is_float(a)}")
IO.puts("is_float(#{b}) = #{is_float(b)}")
IO.puts("is_integer(#{a}) = #{is_integer(a)}")
IO.puts("is_integer(#{b}) = #{is_integer(b)}")
IO.puts("is_number(#{a}) = #{is_number(a)}")
IO.puts("is_number(#{b}) = #{is_number(b)}")


IO.puts("===========================")
text = "Hello world (#{isOpen})"
IO.puts(text)
IO.puts("is.binary(\"#{text}\") = #{is_binary(text)}")
n = 5
IO.puts("is.binary(#{n}) = #{is_binary(n)}")
n = String.length(text)
IO.puts("String.length(\"#{text}\") = #{n}")
IO.puts("byte_size(\"#{text}\") = #{byte_size(text)}")
IO.puts("is.binary(#{n}) = #{is_binary(n)}")
text = "Pingüino"
n = String.length(text)
IO.puts("String.length(\"#{text}\") = #{n}")
IO.puts("byte_size(\"#{text}\") = #{byte_size(text)}")
IO.puts("is.binary(#{text}) = #{is_binary(text)}")

list = [1, "hola", 2.3, false]
tuple = {1, "2", 3.0}
atom = :my_atom
atom2 = MyAtom


















