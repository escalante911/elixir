defmodule Testing do
  def hello do
    :world
  end
end

defmodule User do
  defstruct [:name]
end

defprotocol DbHandler do
 def  create_user(handler, user)
end

defmodule Postgres do
  defimpl DbHandler do
    def create_user(handler, %{name: name}) do
       %User{
        id: 5,
        name: name
      }
    end
  end
end

defmodule PostgresMock do
  defstruct [:user_id]

  defimpl DbHandler do
    def create_user(_handler, %{name: name}) do
       %User{
         id: handler_id
         name: name
        }
    end
  end
end
