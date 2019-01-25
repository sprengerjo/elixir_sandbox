defmodule GoLTest do

  use ExUnit.Case

  test "find neighbours" do
    assert GoL.identify_neighbours() == []
    assert GoL.identify_neighbours({}) == []
    assert GoL.identify_neighbours({1, 1}) == [
             {0, 0},
             {0, 1},
             {0, 2},
             {1, 0},
             {1, 2},
             {2, 0},
             {2, 1},
             {2, 2}
           ]
  end

  test "cell will_life? in next generation" do
    assert GoL.will_life?(0, false) == false
    assert GoL.will_life?(1, false) == false
    assert GoL.will_life?(2, false) == false
    assert GoL.will_life?(4, false) == false
    assert GoL.will_life?(5, true) == false

    assert GoL.will_life?(2, true) == true
    assert GoL.will_life?(3, true) == true
    assert GoL.will_life?(3, false) == true
  end

  test "next generation of named pattern" do
    assert GoL.next_generation([{1, 0}, {1, 1}, {1, 2}]) == [
             {0, 1},
             {1, 1},
             {2, 1}
           ], "blinker pattern must invert cells"
    assert GoL.next_generation([{0, 1}, {1, 1}, {2, 1}]) == [
             {1, 0},
             {1, 1},
             {1, 2}
           ], "blinker pattern must invert cells"
  end

end