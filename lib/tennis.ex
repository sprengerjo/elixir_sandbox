defmodule Tennis do
  @moduledoc """
    Provides tennis score calculator function.

  """

  defp score_to_string(0), do: "love"
  defp score_to_string(1), do: "fifteen"
  defp score_to_string(2), do: "thirty"
  defp score_to_string(3), do: "forty"
  defp score_to_string(4), do: "winner"

  def score(%{:s => s, :r => r}, :r) when r + 1 > s and r + 1 > 3, do: {"returning player wins"}

  def score(%{:s => s, :r => r}, :s) when s + 1 > r and s + 1 > 3, do: {"serving player wins"}

  def score(%{:s => s, :r => r}, :r) when s == r + 1 and s >= 3, do: {"deuce"}

  def score(%{:s => s, :r => r}, :s) when s + 1 == r and r >= 3, do: {"deuce"}

  def score(%{:s => s, :r => r}, :r), do: {score_to_string(s), score_to_string(r + 1)}

  def score(%{:s => s, :r => r}, :s), do: {score_to_string(s + 1), score_to_string(r)}

end