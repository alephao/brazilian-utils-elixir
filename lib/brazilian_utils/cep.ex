defmodule BrazilianUtils.Cep do
  @moduledoc false

  alias BrazilianUtils.Helper

  @spec is_valid?(cep :: String.t() | integer()) :: boolean()
  def is_valid?(cep)

  def is_valid?(cep) when is_binary(cep) do
    cep
    |> Helper.only_numbers()
    |> is_valid_cep_length?
  end

  def is_valid?(cep) when is_integer(cep) do
    Integer.to_string(cep)
    |> is_valid?
  end

  @spec is_valid_cep_length?(cep :: String.t()) :: boolean()
  defp is_valid_cep_length?(cep) when is_binary(cep) do
    String.length(cep) == 8
  end

  @spec format(String.t()) :: String.t()
  def format(cep) when is_binary(cep) do
    {lhs, rhs} =
      cep
      |> Helper.only_numbers()
      |> String.split_at(5)

    if rhs == "" do
      lhs
    else
      (lhs <> "-" <> rhs) |> String.slice(0..8)
    end
  end
end
