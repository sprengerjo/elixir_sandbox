defmodule PersistentBuggerTest do

  use ExUnit.Case

  def testing(numtest, n, ans) do
    IO.puts("Test #{numtest}")
    assert PersistentBugger.persistence(n) == ans
  end

  test "persistence" do
    testing(1, 39, 3)
    testing(2, 4, 0)
    testing(3, 25, 2)
    testing(4, 999, 4)
    testing(5, 444, 3)
  end
end