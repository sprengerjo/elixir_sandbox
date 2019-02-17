defmodule MagnetTest do

  use ExUnit.Case

  def assertFuzzyEquals(actual, expected) do
      merr = 1.0e-6
      inrange = (abs(actual - expected) <= merr)
      IO.puts("In range: #{inrange}")
      if inrange == false do
          exp = Float.round(expected, 6)
          act = Float.round(actual, 6)
          IO.puts("At 1e-6: Expected value must be #{exp} but was #{act}")
      end
      assert inrange == true
  end
  test "doubles" do
      assertFuzzyEquals(Magnet.doubles(1, 10), 0.5580321939764581)
      assertFuzzyEquals(Magnet.doubles(10, 1000), 0.6921486500921933)
  end
end