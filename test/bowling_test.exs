defmodule BowlingTest do
  use ExUnit.Case

  doctest Bowling

  test "gutter games score should be 0" do
    rolls = Enum.map 1..20, fn (_) -> 0 end
    assert Bowling.score(rolls) == 0
  end

  test "one pin rolls score should be 20" do
    rolls = Enum.map 1..20, fn (_) -> 1 end
    assert Bowling.score(rolls) == 20
  end

  test "one spare bonus should be added" do
    rolls = Enum.map 1..18, fn (_) -> 4 end
    rolls = [4, 6 | rolls]
    assert Bowling.score(rolls) == 4 + 6 + 4 + 18 * 4
  end

  test "one strike bonus should be added" do
    rolls = Enum.map 1..18, fn (_) -> 4 end
    rolls = [10 | rolls]
    assert Bowling.score(rolls) == 10 + 4 + 4 + 18 * 4
  end

  test "perfect game score should be 300" do
    rolls = Enum.map 1..12, fn (_) -> 10 end
    assert Bowling.score(rolls) == 300
  end

end
