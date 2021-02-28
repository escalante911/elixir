defmodule UserRepoTest do
  use ExUnit.Case
  doctest UserRepo

  test "create users" do
    db_handler = PostgresMock.init(0)
    db_handler = PostgresMock.create()
    expected = %User{id: 1, name: "Frank"}
    new_user = UserRepo.createOne(db_handler, name: "Frank")
    assert expected == new_user

    expected = %User{id: 2, name: "Jose"}
    new_user = UserRepo.createOne(db_handler, name: "Jose")
    assert expected == new_user

    expected = %User{id: 3, name: "Luis"}
    new_user = UserRepo.createOne(db_handler, name: "Luis")
    assert expected == new_user
  end

  test "users out of range" do
    db_handler = PostgresMock.create()

    UserRepo.createOne(db_handler, name: "Frank")
    UserRepo.createOne(db_handler, name: "Jose")

    assert UserRepo.findOne(db_handler, -1) == nil
    assert UserRepo.findOne(db_handler, 0) == nil
    assert UserRepo.findOne(db_handler, 1) == %User{id: 1, name: "Frank"}
    assert UserRepo.findOne(db_handler, 2) == %User{id: 2, name: "Jose"}
    assert UserRepo.findOne(db_handler, 3) == nil
    assert UserRepo.findOne(db_handler, 4) == nil
  end

  test "finding users" do
    db_handler = PostgresMock.create()

    UserRepo.createOne(db_handler, name: "Frank")
    UserRepo.createOne(db_handler, name: "Jose")

    assert UserRepo.findOne(db_handler, 1) == %User{id: 1, name: "Frank"}
    assert UserRepo.findOne(db_handler, 2) == %User{id: 2, name: "Jose"}
  end
end
