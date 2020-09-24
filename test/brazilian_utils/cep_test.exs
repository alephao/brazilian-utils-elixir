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

  test "format" do
    assert Cep.format("") == ""
    assert Cep.format("") == ""
    assert Cep.format("0") == "0"
    assert Cep.format("01") == "01"
    assert Cep.format("010") == "010"
    assert Cep.format("0100") == "0100"
    assert Cep.format("01001") == "01001"
    assert Cep.format("010010") == "01001-0"
    assert Cep.format("0100100") == "01001-00"
    assert Cep.format("01001000") == "01001-000"

    assert Cep.format("01001000000000") == "01001-000"

    assert Cep.format("a0.10cr01?00#ab0") == "01001-000"
  end
end
