defmodule BrazilianUtils.Cpf do
  @moduledoc false

  alias BrazilianUtils.Helper

  @spec is_valid?(String.t()) :: boolean()
  def is_valid?(cpf) when is_binary(cpf) do
    digits = Helper.only_numbers(cpf)
    is_valid_format?(cpf) and not is_reserved_number?(digits) and is_valid_checksum?(digits)
  end

  @spec is_valid_format?(String.t()) :: boolean()
  defp is_valid_format?(cpf) when is_binary(cpf) do
    Regex.match?(~r/^\d{3}\.?\d{3}\.?\d{3}-?\d{2}$/, cpf)
  end

  @spec is_reserved_number?(String.t()) :: boolean()
  defp is_reserved_number?(cpf_digits) when is_binary(cpf_digits) do
    [
      "00000000000",
      "11111111111",
      "22222222222",
      "33333333333",
      "44444444444",
      "55555555555",
      "66666666666",
      "77777777777",
      "88888888888",
      "99999999999"
    ]
    |> Enum.member?(cpf_digits)
  end

  @spec is_valid_checksum?(String.t()) :: boolean()
  def is_valid_checksum?(cpf_digits) when is_binary(cpf_digits) do
    [9, 10]
    |> Enum.all?(fn i ->
      mod =
        cpf_digits
        |> String.slice(0..(i - 1))
        |> Helper.generate_checksum(i + 1)
        |> Integer.mod(11)

      digit = Integer.to_string(if mod < 2, do: 0, else: 11 - mod)
      String.at(cpf_digits, i) == digit
    end)
  end
end
