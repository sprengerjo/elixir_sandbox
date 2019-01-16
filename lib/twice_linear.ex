defmodule Twice do
  @moduledoc """
    see `https://www.codewars.com/kata/twice-linear/`
  """

  def dbl_linear_tuple(n), do: dbl_linear_tuple(n, {1}, 1, 0, 0)
  defp dbl_linear_tuple(n, u, i, _, _) when i > n, do: elem(u, 0)
  defp dbl_linear_tuple(n, u, i, x, y) do
    l = i - 1
    i = i + 1

    ux = 2 * elem(u, l - x) + 1
    uy = 3 * elem(u, l - y) + 1

    {u, x, y} = insert_appropriately(u, x, y, ux, uy)
    dbl_linear_tuple(n, u, i, x, y)
  end

  defp insert_appropriately(u, x, y, ux, uy) when ux <= uy do
    x = x + 1
    u = Tuple.insert_at(u, 0, ux)

    if ux == uy do
      y = y + 1
      {u, x, y}
    else
      {u, x, y}
    end
  end

  defp insert_appropriately(u, x, y, _, uy) do
    y = y + 1
    u = Tuple.insert_at(u, 0, uy)
    {u, x, y}
  end

  use Bitwise

  def dbl_linear_knuth(n) do

    {_, un} = Enum.reduce(
      1..n,
      {%{0 => 1}, 1},
      fn (i, {u, un}) ->

        x = Integer.floor_div((un - 1), 2)
        y = Integer.floor_div((un - 1), 3)

        xx = binary(x, u, 0, i - 1)
        yy = binary(y, u, 0, i - 1)

        un = 1 + Kernel.min(2 * xx, 3 * yy)
        u = Map.put(
          u,
          i,
          un
        )

        {
          u,
          un
        }

      end
    )
    un
  end

  defp binary(0, _, _, _), do: 1
  defp binary(_, cache, lb, ub) when ub - lb <= 1 do
    %{^ub => un} = cache
    un
  end

  defp binary(un, cache, lb, ub) do
    mid = lb + (
      (ub - lb)
      >>> 1)

    %{^mid => mid_v} = cache

    if mid_v > un do
      binary(un, cache, lb, mid)
    else
      binary(un, cache, mid, ub)
    end
  end

  def dbl_linear(n), do: dbl_linear(n, n, 1, [], [], 3, 4, [], [])

  defp dbl_linear(_, 0, un, _, _, _, _, _, _), do: un

  defp dbl_linear(n, i, u, x, y, ux, uy, seq_x, seq_y) do
    {u, x, y, ux, uy, seq_x, seq_y} = insert_list(u, x, y, ux, uy, seq_x, seq_y)

    dbl_linear(n, i - 1, u, x, y, ux, uy, seq_x, seq_y)
  end

  defp insert_list(_, x, y, ux, uy, seq_x, seq_y) when ux <= uy do
    {x, y} = nexts(x, y, ux)
    next_x(ux, x, y, ux, uy, seq_x, seq_y)
  end

  defp insert_list(_, x, y, ux, uy, seq_x, seq_y) do
    {x, y} = nexts(x, y, uy)
    next_y(uy, x, y, ux, uy, seq_x, seq_y)
  end

  defp next_x(un, x, y, ux, uy, [], seq_y), do: next_x(un, [], y, ux, uy, :lists.reverse(x), seq_y)

  defp next_x(_, x, y, un_x, un_y, [ux | seq_x] , [uy | seq_y]) when un_x == un_y, do: {un_x, x, y, ux, uy, seq_x, seq_y}

  defp next_x(_, x, y, un, uy, [ux | seq_x], seq_y), do: {un, x, y, ux, uy, seq_x, seq_y}

  defp next_y(un, x, y, ux, uy, seq_x, []), do: next_y(un, x, [], ux, uy, seq_x, :lists.reverse(y))

  defp next_y(_, x, y, ux, un, seq_x, [uy | seq_y]), do: {un, x, y, ux, uy, seq_x, seq_y}

  defp nexts(x, y, v), do:  {[2 * v + 1 | x], [3 * v + 1 | y]}

end