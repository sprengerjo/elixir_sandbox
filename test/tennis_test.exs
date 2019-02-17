defmodule TennisTest do
  use ExUnit.Case

  test "combinations of one point for serve or returning player" do
    assert Tennis.score(%{s: 0, r: 0}, :r) == {"love",  "fifteen"}
    assert Tennis.score(%{s: 0, r: 0}, :s) == {"fifteen", "love"}
  end

  test "combinations of two points for serve or returning player" do
    assert Tennis.score(%{s: 0, r: 1}, :r) == {"love",  "thirty"}
    assert Tennis.score(%{s: 1, r: 0}, :s) == {"thirty", "love"}
  end

  test "combinations of three points for serve or returning player" do
    assert Tennis.score(%{s: 0, r: 2}, :r) == {"love",  "forty"}
    assert Tennis.score(%{s: 2, r: 0}, :s) == {"forty", "love"}
  end

  test "combinations of points for serve or returning player" do
    assert Tennis.score(%{s: 1, r: 0}, :r) == {"fifteen",  "fifteen"}
    assert Tennis.score(%{s: 0, r: 1}, :s) == {"fifteen", "fifteen"}

    assert Tennis.score(%{s: 1, r: 1}, :s) == {"thirty", "fifteen"}
    assert Tennis.score(%{s: 1, r: 1}, :r) == {"fifteen", "thirty"}
  end

  test "combinations of winner for serve or returning player" do
    assert Tennis.score(%{s: 0, r: 3}, :r) == {"returning player wins"}
    assert Tennis.score(%{s: 3, r: 0}, :s) == {"serving player wins"}
  end

  test "same score over 3 returns deuce" do
    assert Tennis.score(%{s: 3, r: 2}, :r) == {"deuce"}
    assert Tennis.score(%{s: 3, r: 4}, :s) == {"deuce"}
  end

end