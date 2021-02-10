table = :ets.new(:my_bucket, [:set, :protected])
table
is_pid(table)
:ets.insert(table, {"bar", self()})
:ets.lookup(table, "bar")
:ets.insert(table, {"bar", 3})
:ets.lookup(table, "bar")
:ets.insert(table, {"foo", "bar"})
:ets.lookup(table, "bar")

#####-----------------#####-----------------#####-----------------#####--------------------#####-------------------#####

table = :ets.new(:my_bucket, [:set, :protected])  #Reference<????????>
:ets.insert(table, {"a", 1})                      # true
:ets.insert(table, {"b", 2})                      # true
:ets.lookup(table, "a")                           # [{"a", 2}]
:ets.insert(table, {"a", 1})                      # true
:ets.lookup(table, "a")                           # [{"a", 1}]

#####################################

table = :ets.new(:my_bucket, [:bag, :protected])  #Reference<????????>
:ets.insert(table, {"a", 1})                      # true
:ets.insert(table, {"b", 2})                      # true
:ets.lookup(table, "a")                           # [{"a", 1}, {"a", 2}]
:ets.insert(table, {"a", 1})                      # true
:ets.lookup(table, "a")                           # [{"a", 1}, {"a", 2}]

#####################################

table1 = :ets.new(:my_bucket, [:bag, :protected])                   #Reference<????????>
:ets.insert(table1, {:hello, 1})                                    # true
:ets.insert(table1, {:hello, 2})                                    # true
:ets.lookup(table1, :hello)                                         # [{:hello, 1}, {:hello, 2}]
spawn_link fn -> :ets.lokup(table1, :hello) end                     # PID<???>
parent = self()                                                     # PID<???>
spawn_link fn -> send parent, :ets.lookup(table1, :hello) end       # PID<???>
receive do
  x -> x
end                                                                 # [hello: 1, hello: 2]
spawn_link fn -> send parent, :ets.insert(table1, {:hello, 3}) end  # throws ArgumentError, cant insert, table1 is protected

#####################################

table1 = :ets.new(:my_bucket, [:bag, :private]) #Reference<????????>
parent = self()
spawn_link fn -> send parent, :ets.lookup(table1, "a") end # throws ArgumentError, cant insert, table1 is private
