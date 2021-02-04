


# Reading x
x = 3
list = for n <- [1, 2, 3, 4], do: n + x
IO.inspect list # [4, 5, 6, 7] (as charlist)

# Updating x ?
x = 3 # This will not be updated
list = for n <- [1, 2, 3, 4] do
  x = n + x
  # ^-- x is unsued
end
IO.inspect list # [4, 5, 6, 7]








values = [1, 3, 2, 6, 5, 9, 8, 24, 20]
even? = &(rem(&1, 2) == 0)
list = for n <- values, even?.(n), do: n * n
IO.inspect list # [4, 36, 64, 576, 400]

##
letters = [:x, :y, :z]
numbers = [1, 2, 3, 4]
for l <- letters, n <- numbers, do: {l, n}

evens = [0,2,4,6,8,10,12]
mod3_numbers = [0,3,6,9,12]
list = _ <- evens; n <- mod3_numbers, do: numbers
IO.inspect list

##
values = [[1, 2], [], [4, 5]]
list = for list <- values,
    n <- list do
  n
  end
IO.inspect list

##
dirs = [
  "./",
  "../03-loops"
]

for dir <- dirs,
