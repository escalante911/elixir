double = fn x -> 2 * x end
triple = fn x -> 3 * x end
filter = fn n -> rem(n, 4) == 0 end
is_mod3_plus_1 = fn n -> rem(n, 3) == 1 end
is_mod3_plus_1 = fn n -> rem(n, 3) == 2 end

list = 0..7

# a |> proc(fun)
# proc(a, fun)
result_enum = Enum.filter(Enum.map(list, double), filter)

# result_enum1 = Enum.map(list, double) |> Enum.filter(filter)
# result_enum1 = ( list |> Enum.map(double) ) |> Enum.filter(filter)
result_enum1 = list |> Enum.map(double) |> Enum.filter(filter)

IO.puts("#{inspect(result_enum)}")
IO.puts("#{inspect(result_enum1)}")
IO.puts("------------------------")

#int[] list = {0, 1, ..., 7}
#int [] doubles = {}
#int [] result = {}
#for(int i = 0; i < N; i++){
#  doubles[i] = double(list[i])
#}
#
#for(int i = 0; i < N; i++){
#  triples[i] = triple(double[i])
#}
#
#for(int i = 0; i < N; i++){
#  triples[i] = triple(double[i])
#}
#
#for(int i = 0; i < N; i++){
#  int x = list[i];
#  if(filter(x)){
#    result.push(x)
#  }
#}
result = list |> Enum.map(double) |> Enum.map(triple) |> Enum.filter(filter)
IO.puts("#{inspect(result)}")
IO.puts("-------------------")


# int[] list = {0, 1, ..., 7}
# int[] sextuplets = {};
# int[] result = {};
# for(int i = 0; i < N; i++){
#   int x = triple(double)
# }
