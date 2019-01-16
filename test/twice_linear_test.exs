defmodule TwiceTest do
  use ExUnit.Case

  defp dotest(fun, n, exp) do
    IO.puts("Testing : #{n}")
    act = fun.(n)
    assert act == exp
  end

  test "different implementations of dbl_linear" do
    funs = [
      fn (n) -> Twice.dbl_linear(n) end,
      fn (n) -> Twice.dbl_linear_knuth(n) end,
      fn (n) -> Twice.dbl_linear_tuple(n) end
    ]

    Enum.each(
      funs,
      fn (fun) ->
        dotest = fn (n, exp) -> dotest(fun, n, exp) end

        dotest.(20, 57)
        dotest.(10, 22)
        dotest.(30, 91)
        dotest.(50, 175)
        dotest.(6000, 80_914)
        dotest.(60_000, 1_511_311)
      end
    )
  end

  test "list implementation - big n " do
    fun = fn (n) -> Twice.dbl_linear(n) end

    dotest(fun, 100_000, 2_911_582)
    dotest(fun, 1_000_000, 54_381_286)
  end

  test "knuth implementation - big n " do
    fun = fn (n) -> Twice.dbl_linear_knuth(n) end

    dotest(fun, 100_000, 2_911_582)
    dotest(fun, 1_000_000, 54_381_286)
  end

  @tag :skip
  test "tuple implementation - big n " do
    fun = fn (n) -> Twice.dbl_linear_tuple(n) end

    dotest(fun, 100_000, 2_911_582)
    dotest(fun, 1_000_000, 54_381_286)
  end

end