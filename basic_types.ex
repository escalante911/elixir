# Integer
n = 102
n_hex = 0x41 # = 65
n_octal = 0o24 # = 20

IO.puts("a = #{n}, b = #{n_hex}, c =#{n_octal}")

q = div(35, 4) # 8
r = rem(35, 4) # 3

IO.puts("div(35, 4) = #{q}")
IO.puts("rem(35, 4) = #{r}")

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

IO.puts String.upcase(text)

IO.puts("===========================")
atom = :my_atom
atom2 = MyAtom
IO.puts "is_atom(4) = #{is_atom(4)}"
IO.puts "is_atom(#{atom}) = #{is_atom(atom)}"
IO.puts "is_boolean(#{atom}) = #{is_boolean(atom)}"
IO.puts "is_atom(#{atom2}) = #{is_atom(atom2)}"
IO.puts "is_boolean(#{atom2}) = #{is_boolean(atom2)}"

t = true
f = false
IO.puts "is_atom(#{t}) = #{is_atom(t)}"
IO.puts "is_atom(#{f}) = #{is_atom(f)}"
IO.puts "(:true == true) = #{:true == true}"
IO.puts "(:false == false) = #{:false == false}"
IO.puts "(:true == false) = #{:true == false}"

IO.puts("#{:ok}")
IO.puts("#{:error}")

IO.puts("===========================")
add = fn(x, y) ->
  # more lines of code
  x + y
end

sub = fn(x, y) -> x - y end

s = add.(1, 2)
r = sub.(5, 3)

# IO.puts("#{add}") # Throws an error. "add" can not formatted as string
IO.puts("is_function(add) = #{is_function(add)}")
IO.puts("is_function(sub) = #{is_function(sub)}")
IO.puts("add.(1, 2) = #{s}")
IO.puts("sub.(5, 3) = #{r}")

IO.puts("is_function(add, 0) = #{is_function(add, 0)}")
IO.puts("is_function(add, 1) = #{is_function(add, 1)}")
IO.puts("is_function(add, 2) = #{is_function(add, 2)}")
IO.puts("is_function(add, 3) = #{is_function(add, 3)}")

double = fn x -> add.(x, x) end
IO.puts("double.(5) = #{double.(5)}")

five = (fn x -> x + 1 end).(4)
IO.puts("five = #{five}")


IO.puts("===========================")
list = [1, "hola", 2.3, false]
# IO.puts("list = #{list}") # A list can not be printed
len = length list # length(list)
IO.puts("length(list) = #{len}")
IO.puts("length(list) = #{length list}")



tuple = {1, "2", 3.0}





















