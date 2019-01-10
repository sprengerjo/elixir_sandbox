defmodule Tribonacci do
  @moduledoc """
    Provides Tribonacci sequence.

    see `https://www.codewars.com/kata/tribonacci-sequence/`
  """

  def trib({_, _, _}, 0) do
    [] end

  def trib({a, _, _}, 1) do
    [a] end

  def trib({a, b, c}, n) do
    [a | trib({b, c, a + b + c}, n - 1)] end

end
