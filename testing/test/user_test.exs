defmodule UserTest do
  use ExUnit.Case
  doctest UserRepo

  test "UserRepoImpl.pid is nill" do
    repo = %UserRepoImpl{pid: nil}
    assert_raise UndefinedFunctionError, fn -> UserRepo.find_one(repo, 1) end
  end

  test "crear usuarios" do
       db =  PostgresMock.create()
       repo = UserRepoImpl.create(db) # GenServer.start_link(__MODULE__, db)

       expected = %User{id: 1, name: "Jose"}
       user = UserRepo.createOne(repo, name: "Jose")

       assert expected == user
  end

  test "encontrar usuarios fuera de rango" do
       db =  PostgresMock.create()
       repo = UserRepoImpl.create(db)

       UserRepo.createOne(repo, name: "Jose")
       UserRepo.createOne(repo, name: "Luis")

       assert UserRepo.findOne(repo, -1) == nil
       assert UserRepo.findOne(repo, 0) == nil
       assert UserRepo.findOne(repo, 3) == nil
       assert UserRepo.findOne(repo, 4) == nil
  end

  test "encontrar usuarios" do
         db =  PostgresMock.create()
         repo = UserRepoImpl.create(db)

         UserRepo.createOne(repo, name: "Jose")
         UserRepo.createOne(repo, name: "Luis")

         assert UserRepo.findOne(repo, 1) == %User{id: 1, name: "Jose"}
         assert UserRepo.findOne(repo, 2) == %User{id: 2, name: "Luis"}
  end

  test "UserRepoImpl.db is nill" do
    repo = %UserRepoImpl2{db: nil}
    assert_raise UndefinedFunctionError, fn -> UserRepo.find_one(repo, 1) end
  end

  test "UserRepoImpl.db is nill" do
    db =  PostgresMock.create()
    repo = UserRepoImpl2.create(db)
  end

end
