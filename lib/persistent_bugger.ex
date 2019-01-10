defmodule PersistentBugger do
  @moduledoc """
    see `https://www.codewars.com/kata/persistent-bugger/`
  """

  def persistence(n), do: persistence(n, 0)

  defp persistence(n, count) when n < 10, do: count
  defp persistence(n, count), do: persistence(next(n), count + 1)

  defp next(n), do: Enum.reduce(Integer.digits(n), &(&1 * &2))

end