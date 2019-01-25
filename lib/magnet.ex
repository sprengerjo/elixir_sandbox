defmodule Magnet do

  @moduledoc """
    see `https://www.codewars.com/kata/56c04261c3fcf33f2d000534/`
  """

  def doubles(maxk, maxn) do
    Enum.sum for(
               k <- 1..maxk,
               n <- 1..maxn,
               do: 1 / (k * :math.pow(n + 1, 2 * k))
             )
  end

end