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

  test "format" do
    assert Cpf.format("") == ""
    assert Cpf.format("9") == "9"
    assert Cpf.format("94") == "94"
    assert Cpf.format("943") == "943"
    assert Cpf.format("9438") == "943.8"
    assert Cpf.format("94389") == "943.89"
    assert Cpf.format("943895") == "943.895"
    assert Cpf.format("9438957") == "943.895.7"
    assert Cpf.format("94389575") == "943.895.75"
    assert Cpf.format("943895751") == "943.895.751"
    assert Cpf.format("9438957510") == "943.895.751-0"
    assert Cpf.format("94389575104") == "943.895.751-04"

    assert Cpf.format("94389575104000000") == "943.895.751-04",
           "should remove leading digits when string is too big"

    assert Cpf.format("943.?ABC895.751-04abc") == "943.895.751-04",
           "should remove all non numeric characters"
  end
end
