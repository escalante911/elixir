defmodule UserTest do
  use ExUnit.Case
  doctest UserRepo

  test "crear usuarios" do
       db =
       db_user = db.pid
       user = UserRepo.createOne(db_user, name: "Jose")
       assert user
  end


end
