defmodule TribonacciTest do
  use ExUnit.Case

  doctest Tribonacci

  test "Basic tests" do

    assert Tribonacci.trib({1, 1, 1}, 10) == [1, 1, 1, 3, 5, 9, 17, 31, 57, 105]
    assert Tribonacci.trib({0, 0, 1}, 10) == [0, 0, 1, 1, 2, 4, 7, 13, 24, 44]
    assert Tribonacci.trib({0, 1, 1}, 10) == [0, 1, 1, 2, 4, 7, 13, 24, 44, 81]
    assert Tribonacci.trib({1, 0, 0}, 10) == [1, 0, 0, 1, 1, 2, 4, 7, 13, 24]
    assert Tribonacci.trib({0, 0, 0}, 10) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    assert Tribonacci.trib({1, 2, 3}, 10) == [1, 2, 3, 6, 11, 20, 37, 68, 125, 230]
    assert Tribonacci.trib({3, 2, 1}, 10) == [3, 2, 1, 6, 9, 16, 31, 56, 103, 190]
    assert Tribonacci.trib({1, 1, 1}, 1) == [1]
    assert Tribonacci.trib({300, 200, 100}, 0) == []
    assert Tribonacci.trib({0.5, 0.5, 0.5}, 30) == [
             0.5,
             0.5,
             0.5,
             1.5,
             2.5,
             4.5,
             8.5,
             15.5,
             28.5,
             52.5,
             96.5,
             177.5,
             326.5,
             600.5,
             1104.5,
             2031.5,
             3736.5,
             6872.5,
             12_640.5,
             23_249.5,
             42_762.5,
             78_652.5,
             144_664.5,
             266_079.5,
             489_396.5,
             900_140.5,
             1_655_616.5,
             3_045_153.5,
             5_600_910.5,
             10_301_680.5
           ]
  end

end