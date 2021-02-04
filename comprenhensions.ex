


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
