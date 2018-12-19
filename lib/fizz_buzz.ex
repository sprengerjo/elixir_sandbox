defmodule FizzBuzz do
  @moduledoc """
    Provides FizzBuzz sequence.

   ## Examples
       iex> FizzBuzz.upTo(15)
       ["1", "2", "fizz", "4", "buzz", "fizz", "7", "8", "fizz", "buzz", "11", "fizz", "13", "14", "fizzbuzz"]
  """

  def fizz_buzz(i) do
    case i do
      a when rem(a, 15) == 0 -> "fizzbuzz"
      a when rem(a, 3) == 0 -> "fizz"
      a when rem(a, 5) == 0 -> "buzz"
      a -> to_string a
    end
  end

  def upTo(n) do
    Enum.map(1..n, &(fizz_buzz &1))
  end
end
