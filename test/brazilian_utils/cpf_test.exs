defmodule BrazilianUtils.CpfTests do
  use ExUnit.Case, async: true

  alias BrazilianUtils.Cpf

  test "is_valid? on valid cpfs" do
    assert Cpf.is_valid?("681.251.820-47") == true
    assert Cpf.is_valid?("617.821.803-62") == true
    assert Cpf.is_valid?("205.448.357-51") == true
    assert Cpf.is_valid?("70426130405") == true
    assert Cpf.is_valid?("26422588828") == true
  end

  test "is_valid? on invalid cpfs" do
    assert Cpf.is_valid?("681.251.820-97") == false
    assert Cpf.is_valid?("617.821.803-82") == false
    assert Cpf.is_valid?("205.448.357-71") == false
    assert Cpf.is_valid?("70426130465") == false
    assert Cpf.is_valid?("26422588858") == false

    assert Cpf.is_valid?("123") == false
    assert Cpf.is_valid?("123456789012") == false
  end
end
