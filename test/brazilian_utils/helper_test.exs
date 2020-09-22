defmodule BrazilianUtils.HelperTests do
  use ExUnit.Case, async: true

  alias BrazilianUtils.Helper

  test "only_numbers" do
    assert Helper.only_numbers("abcd") == ""
    assert Helper.only_numbers("12345") == "12345"
    assert Helper.only_numbers("12345 ") == "12345"
    assert Helper.only_numbers(" 12345") == "12345"
    assert Helper.only_numbers(" 12345 ") == "12345"
    assert Helper.only_numbers("abcd12345") == "12345"
    assert Helper.only_numbers("123abc456?.#789xyz 0") == "1234567890"

    assert_raise FunctionClauseError, fn ->
      Helper.only_numbers(123)
    end
  end
end
