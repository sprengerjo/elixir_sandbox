defmodule Directions do
  @moduledoc """
    reduces directions sequence.

    see `https://www.codewars.com/kata/directions-reduction/`
  """

  def reduce(directions), do:
    directions
    |> Enum.reverse
    |> Enum.reduce([], &reduce/2)

  defp reduce(curr, []), do: [curr]

  defp reduce("NORTH", ["SOUTH" | tail]), do: tail
  defp reduce("SOUTH", ["NORTH" | tail]), do: tail
  defp reduce("EAST", ["WEST" | tail]), do: tail
  defp reduce("WEST", ["EAST" | tail]), do: tail

  defp reduce(curr, [head | tail]), do: [curr, head | tail]

end