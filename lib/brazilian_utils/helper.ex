defmodule BrazilianUtils.Helper do
  @spec only_numbers(String.t()) :: String.t()
  def only_numbers(value) when is_binary(value) do
    String.replace(value, ~r/[^\d]/, "")
  end
end
