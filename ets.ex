table = :ets.new(:my_bucket, [:set, :protected])
table
is_pid(table)
:ets.insert(table, {"bar", self()})
:ets.lookup(table, "bar")
:ets.insert(table, {"bar", 3})
:ets.lookup(table, "bar")
:ets.insert(table, {"foo", "bar"})
:ets.lookup(table, "bar")
