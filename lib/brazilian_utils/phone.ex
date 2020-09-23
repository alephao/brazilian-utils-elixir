defmodule BrazilianUtils.Phone do
  alias BrazilianUtils.Helper

  @spec is_valid?(String.t()) :: boolean()
  def is_valid?(phone) when is_binary(phone) do
    digits = Helper.only_numbers(phone)

    is_valid_phone_length?(digits) and is_valid_first_number?(digits) and is_valid_ddd?(digits)
  end

  @spec is_valid_mobile_phone?(String.t()) :: boolean()
  def is_valid_mobile_phone?(phone) when is_binary(phone) do
    digits = Helper.only_numbers(phone)

    is_valid_mobile_phone_length?(digits) and is_valid_mobile_first_number?(digits) and
      is_valid_ddd?(digits)
  end

  @spec is_valid_landline_phone?(String.t()) :: boolean()
  def is_valid_landline_phone?(phone) when is_binary(phone) do
    digits = Helper.only_numbers(phone)

    is_valid_landline_phone_length?(digits) and is_valid_landline_first_number?(digits) and
      is_valid_ddd?(digits)
  end

  @spec phone_min_length :: 10
  defp phone_min_length, do: 10

  @spec phone_max_length :: 11
  defp phone_max_length, do: 11

  @spec mobile_valid_first_numbers :: [integer()]
  defp mobile_valid_first_numbers, do: [6, 7, 8, 9]

  @spec landline_valid_first_numbers :: [integer()]
  defp landline_valid_first_numbers, do: [2, 3, 4, 5]

  @spec is_valid_ddd?(String.t()) :: boolean()
  defp is_valid_ddd?(phone) when is_binary(phone) do
    ddd = phone |> String.slice(0..1)

    BrazilianUtils.DataSource.get_valid_area_codes()
    |> Enum.member?(ddd)
  end

  @spec is_valid_mobile_phone_length?(String.t()) :: boolean()
  defp is_valid_mobile_phone_length?(phone) when is_binary(phone) do
    String.length(phone) == phone_max_length()
  end

  @spec is_valid_landline_phone_length?(String.t()) :: boolean()
  defp is_valid_landline_phone_length?(phone) when is_binary(phone) do
    l = String.length(phone)
    l <= phone_max_length() and l >= phone_min_length()
  end

  @spec is_valid_phone_length?(String.t()) :: boolean()
  defp is_valid_phone_length?(phone) when is_binary(phone) do
    is_valid_landline_phone_length?(phone) or is_valid_mobile_phone_length?(phone)
  end

  @spec is_valid_mobile_first_number?(String.t()) :: boolean()
  defp is_valid_mobile_first_number?(phone) when is_binary(phone) do
    first_digit = String.at(phone, 2) |> String.to_integer()

    mobile_valid_first_numbers()
    |> Enum.member?(first_digit)
  end

  @spec is_valid_landline_first_number?(String.t()) :: boolean()
  defp is_valid_landline_first_number?(phone) when is_binary(phone) do
    first_digit = String.at(phone, 2) |> String.to_integer()

    landline_valid_first_numbers()
    |> Enum.member?(first_digit)
  end

  @spec is_valid_first_number?(String.t()) :: boolean()
  defp is_valid_first_number?(phone) when is_binary(phone) do
    if String.length(phone) == phone_min_length() do
      is_valid_landline_first_number?(phone)
    else
      is_valid_mobile_first_number?(phone)
    end
  end
end
