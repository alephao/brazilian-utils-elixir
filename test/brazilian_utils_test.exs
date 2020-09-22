defmodule BrazilianUtilsTest do
  use ExUnit.Case
  doctest BrazilianUtils

  test "greets the world" do
    assert BrazilianUtils.hello() == :world
  end
end
