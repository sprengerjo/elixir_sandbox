defmodule BOWLING do

  def score(rolls) do
    Enum.sum(rolls) + bonus(rolls)
  end

  def bonus(rolls) do
    case rolls do
      [] -> 0
      [_, _, _] -> 0
      [10 | tail] -> Enum.sum(Enum.take tail, 2) + bonus tail
      [head, second | tail] when head + second == 10 -> Enum.at tail, 0 + bonus tail
      [_, _ | tail] -> bonus tail
    end
  end
end