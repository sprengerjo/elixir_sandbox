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

  def bonus(rolls) do
    case rolls do
      [] -> 0
      [_, _, _] -> 0
      [10 | tail] -> Enum.sum(Enum.take tail, 2) + bonus tail
      [head, second | tail] when head + second == 10 -> List.first(tail) + bonus tail
      [_, _ | tail] -> bonus tail
    end
  end
end
