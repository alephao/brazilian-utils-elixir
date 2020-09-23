defmodule BrazilianUtils.PhoneTests do
  use ExUnit.Case, async: true

  alias BrazilianUtils.Phone

  test "is_valid? on empty strings" do
    assert Phone.is_valid?("") == false
    assert Phone.is_valid_mobile_phone?("") == false
    assert Phone.is_valid_landline_phone?("") == false
  end

  test "is_valid? when phone is too short" do
    assert Phone.is_valid?("119000000") == false
    assert Phone.is_valid_mobile_phone?("1190000000") == false
    assert Phone.is_valid_landline_phone?("113000000") == false
  end

  test "is_valid? when phone is too long" do
    assert Phone.is_valid?("119000000000") == false
    assert Phone.is_valid_mobile_phone?("119000000000") == false
    assert Phone.is_valid_landline_phone?("113000000000") == false
  end

  test "is_valid? mobile with invalid state" do
    assert Phone.is_valid?("(00) 9 0000-0000") == false
    assert Phone.is_valid?("009900000000") == false

    assert Phone.is_valid_mobile_phone?("(00) 9 0000-0000") == false
    assert Phone.is_valid_mobile_phone?("00900000000") == false
  end

  test "is_valid? landline with invalid state" do
    assert Phone.is_valid?("(00) 3000-0000") == false
    assert Phone.is_valid?("0030000000") == false

    assert Phone.is_valid_landline_phone?("(00) 3000-0000") == false
    assert Phone.is_valid_landline_phone?("0030000000") == false
  end

  test "is_valid? with valid ddds" do
    BrazilianUtils.DataSource.get_valid_area_codes()
    |> Enum.each(fn area_code ->
      assert Phone.is_valid?("(#{area_code}) 9 0000-0000") == true
    end)

    BrazilianUtils.DataSource.get_valid_area_codes()
    |> Enum.each(fn area_code ->
      assert Phone.is_valid?("(#{area_code}) 3000-0000") == true
    end)
  end

  test "is_valid? with a valid mobile phone" do
    assert Phone.is_valid?("(11) 9 0000-0000") == true
    assert Phone.is_valid?("11900000000") == true
    assert Phone.is_valid_mobile_phone?("(11) 9 0000-0000") == true
    assert Phone.is_valid_mobile_phone?("11900000000") == true

    assert Phone.is_valid_landline_phone?("(11) 9 0000-0000") == false
    assert Phone.is_valid_landline_phone?("11900000000") == false
  end

  test "is_valid? with a valid landline phone" do
    assert Phone.is_valid?("(11) 3000-0000") == true
    assert Phone.is_valid?("1130000000") == true
    assert Phone.is_valid_landline_phone?("(11) 3000-0000") == true
    assert Phone.is_valid_landline_phone?("1130000000") == true

    assert Phone.is_valid_mobile_phone?("(11) 3000-0000") == false
    assert Phone.is_valid_mobile_phone?("1130000000") == false
  end
end
