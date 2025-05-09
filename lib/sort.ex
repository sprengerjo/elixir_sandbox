defmodule Sort do

  def slowsort([]), do: []

  def slowsort([first | tail]) do
    smaller = Enum.filter(tail, &(&1 <= first))
    bigger = Enum.filter(tail, &(&1 > first))

    slowsort(smaller) ++ [first] ++ slowsort(bigger)
  end

  def quicksort(list), do: quicksort(list, [])

  defp quicksort([], acc), do: acc

  defp quicksort([pivot | rest], acc) do
    {left, right} = Enum.split_with(rest, &(&1 <= pivot))
    quicksort(left, [pivot | quicksort(right, acc)])
  end

  def mergesort([]), do: []
  def mergesort([a]), do: [a]

  def mergesort(list) do
    {left, right} = Enum.split(list, div(length(list), 2))

    merge(mergesort(left), mergesort(right))
  end

  defp merge([], right), do: right
  defp merge(left, []), do: left

  defp merge([h1 | t1], [h2 | t2]) do
    if h1 <= h2 do
      [h1 | merge(t1, [h2 | t2])]
    else
      [h2 | merge([h1 | t1], t2)]
    end
  end
end
