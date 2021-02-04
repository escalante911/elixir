subject = Observable.create()

IO.puts(Observable.read(subject))

Observable.attach(subject)

Observable.increment(subject)
IO.puts(Observable.await())

Observable.increment(subject)
IO.puts(Observable.await())

Observable.decrement(subject)
IO.puts(Observable.await())

Observable.increment(subject)
IO.puts(Observable.await())

Observable.detach(subject)
Observable.increment(subject)
IO.puts(Observable.await())
