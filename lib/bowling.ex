defmodule Bowling do
  @moduledoc """
    Provides bowling calculator function.

   ## Examples
       iex> rolls = Enum.map 1..12, fn (_) -> 10 end
       iex> Bowling.score(rolls)
       300
  """

  def score(rolls) do
    Enum.sum(rolls) + bonus(rolls)
  end

  defp bonus([]), do: 0
  defp bonus([_, _, _]), do: 0
  defp bonus([10 | tail]), do: Enum.sum(Enum.take tail, 2) + bonus tail
  defp bonus([head, second | tail]) when head + second == 10, do: List.first(tail) + bonus tail
  defp bonus([_, _ | tail]), do: bonus tail

end
