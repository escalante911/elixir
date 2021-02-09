
IO.puts("------------------------")

{:ok, observer} = GsObserver.create(0)
GsObserver.read(observer) |> IO.inspect()
GsObserver.attach(observer) |> IO.inspect()
GsObserver.read(observer) |> IO.inspect()
GsObserver.increment(observer, 2) |> IO.inspect()
GsObserver.read(observer) |>  IO.inspect()
GsObserver.decrement(observer, 1) |> IO.inspect()
GsObserver.read(observer) |>  IO.inspect()
