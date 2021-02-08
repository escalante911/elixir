import User

user =
  create_user()
  |> set_name("Jose", "Escalante")
  |> set_country("Colombia")
  |> set_languages(["spanish"])

  inspect(user) |> IO.puts()

  user =
    create_user()
    |> set_name("Frank", "Moreno")
    |> set_country("Peru")
    |> set_languages(["spanish", "english", "german"])

    inspect(user) |> IO.puts()
