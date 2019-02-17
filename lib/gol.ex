defmodule GoL do
  @moduledoc """
     Provides Game of life functions.
   """

  def identify_neighbours(), do: []
  def identify_neighbours({}), do: []

  def identify_neighbours({x, y}) do
    d = [-1, 0, 1]

    for(
      dx <- d,
      dy <- d,
      dx != 0 or dy != 0,
      do:
        {dx + x, dy + y}
    )
  end

  def will_life?(2, alive), do: alive
  def will_life?(3, _), do: true
  def will_life?(_, _), do: false

  def next_generation(cells) do
    actual = cells
             |> Enum.flat_map(&identify_neighbours/1)
             |> Enum.reduce(
                  %{},
                  fn x, acc ->
                    try do
                      %{^x => n} = acc
                      Map.put(acc, x, n + 1)
                    rescue _ -> MatchError
                                Map.put(acc, x, 1)
                    end
                  end
                )
             |> Map.to_list
             |> Enum.filter(fn {cell, n} -> will_life?(n, Enum.member?(cells, cell)) end)
             |> Enum.map(fn {cell, _} -> cell end)

    actual
  end
end