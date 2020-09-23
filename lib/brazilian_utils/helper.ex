defmodule BrazilianUtils.Helper do
  @moduledoc false

  @spec only_numbers(String.t()) :: String.t()
  def only_numbers(value) when is_binary(value) do
    String.replace(value, ~r/[^\d]/, "")
  end

  @spec generate_checksum(String.t(), integer()) :: integer()
  def generate_checksum(base, weight) when is_binary(base) and is_integer(weight) do
    base
    |> only_numbers()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce({weight, 0}, fn digit, {multiplier, sum} ->
      {multiplier - 1, sum + digit * multiplier}
    end)
    |> elem(1)
  end
end
