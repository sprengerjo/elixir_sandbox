defmodule SortTest do
  use ExUnit.Case
  alias Sort

  test "sort a list", %{} do
    assert Sort.slowsort([]) == []
    assert Sort.slowsort([1]) == [1]
    assert Sort.slowsort([1, 2]) == [1, 2]
    assert Sort.slowsort([2, 1]) == [1, 2]
    assert Sort.slowsort([3, 2, 1]) == [1, 2, 3]
    assert Sort.slowsort([2, 3, 1]) == [1, 2, 3]
  end

  @tag :benchmark
  test "sorts a randomly generated list" do
    size = 100_000
    :rand.seed(:exsplus, {1234, 5678, 9012})

    list = Enum.map(1..size, fn _ -> :rand.uniform(1_000_000) end)
    {slowsort_time, slowsorted} = :timer.tc(fn -> Sort.slowsort(list) end)
    {quick_time, quick_sorted} = :timer.tc(fn -> Sort.quicksort(list) end)
    {merge_time, merge_sorted} = :timer.tc(fn -> Sort.mergesort(list) end)
    {enum_time, enum_sorted} = :timer.tc(fn -> Enum.sort(list) end)

    assert slowsorted == enum_sorted
    assert quick_sorted == enum_sorted
    assert merge_sorted == enum_sorted

    IO.puts("Slow sort time: #{slowsort_time} μs")
    IO.puts("QuickSort time: #{quick_time} μs")
    IO.puts("MergeSort time: #{merge_time} μs")
    IO.puts("Enum.sort/1 time: #{enum_time} μs")
  end
end
