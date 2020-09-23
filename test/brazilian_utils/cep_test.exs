defmodule BrazilianUtils.CepTests do
  use ExUnit.Case, async: true

  alias BrazilianUtils.Cep

  test "is_valid" do
    assert Cep.is_valid?("12345678") == true
    assert Cep.is_valid?("12345-678") == true
    assert Cep.is_valid?(12_345_678) == true

    assert Cep.is_valid?("1") == false
    assert Cep.is_valid?("123456789") == false
    assert Cep.is_valid?("12345-6789") == false
    assert Cep.is_valid?(0) == false
    assert Cep.is_valid?(123_456_789) == false

    assert_raise FunctionClauseError, fn ->
      Cep.is_valid?(%{foo: :bar})
    end
  end
end
