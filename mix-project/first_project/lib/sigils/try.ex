IO.puts("SEction 1 ------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  AritmetcError -> IO.puts("The disivions was not possible")
end

IO.puts("SEction 2 ------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  AritmetcError -> IO.puts("The disivions was not possible")
end

IO.puts("SEction 3 ------------")

try do
  raise CustomError, message: "My custom error"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
end
