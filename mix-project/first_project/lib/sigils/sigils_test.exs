defmodule SigilsTest do
  use ExUnit.Case
  doctest Sigils

  test "sigil test" do
    import Sigil, only:
    assert ~i[5] == 5
    assert ~i[5]n == -5
    assert ~i[-5]a == 5
  end
end
