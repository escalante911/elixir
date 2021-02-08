import User

user =
  create_user()
  |> set_name("Jose", "Escalante")
  |> set_country("Peru")
  |> set_languages(["spanish"])

  inspect(user) |> IO.puts()
