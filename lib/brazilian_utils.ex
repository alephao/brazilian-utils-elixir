defmodule BrazilianUtils do
  @spec get_cities(String.t()) :: [String.t()]
  def get_cities(uf) when is_binary(uf) do
    BrazilianUtils.DataSource.get_cities(uf)
  end

  @spec get_states() :: [%{code: String.t(), name: String.t()}]
  def get_states() do
    BrazilianUtils.DataSource.get_states()
  end

  @spec is_cep_valid?(String.t() | integer()) :: boolean()
  def is_cep_valid?(cep) when is_binary(cep) or is_integer(cep) do
    BrazilianUtils.Cep.is_valid?(cep)
  end

  @spec is_cpf_valid?(String.t()) :: boolean()
  def is_cpf_valid?(cpf) when is_binary(cpf) do
    BrazilianUtils.Cpf.is_valid?(cpf)
  end

  @spec is_phone_valid?(String.t()) :: boolean()
  def is_phone_valid?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid?(phone)
  end

  @spec is_mobile_valid?(String.t()) :: boolean()
  def is_mobile_valid?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid_mobile_phone?(phone)
  end

  @spec is_landline_valid?(String.t()) :: boolean()
  def is_landline_valid?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid_landline_phone?(phone)
  end
end
