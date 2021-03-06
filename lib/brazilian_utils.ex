defmodule BrazilianUtils do
  @moduledoc """
  Utilities library for Brazilian Businesses
  """

  @doc ~S"""
  Get a list of Brazilian cities given a state's UF.

  ## Examples

    Getting cities from Acre:

      iex> BrazilianUtils.get_cities("AC")
      ["Acrelândia", "Assis Brasil", "Brasiléia", "Bujari", "Capixaba",
      "Cruzeiro do Sul", "Epitaciolândia", "Feijó", "Jordão", "Manoel Urbano",
      "Marechal Thaumaturgo", "Mâncio Lima", "Plácido de Castro", "Porto Acre",
      "Porto Walter", "Rio Branco", "Rodrigues Alves", "Santa Rosa do Purus",
      "Sena Madureira", "Senador Guiomard", "Tarauacá", "Xapuri"]
  """
  @spec get_cities(String.t()) :: [String.t()]
  def get_cities(uf) when is_binary(uf) do
    BrazilianUtils.DataSource.get_cities(uf)
  end

  @doc ~S"""
  Get a list with the name and UF of all Brazilian states.

  ## Examples

      iex> BrazilianUtils.get_states()
      [
        %{code: "AC", name: "Acre"},
        %{code: "AL", name: "Alagoas"},
        %{code: "AM", name: "Amazonas"},
        %{code: "AP", name: "Amapá"},
        %{code: "BA", name: "Bahia"},
        %{code: "CE", name: "Ceará"},
        %{code: "DF", name: "Distrito Federal"},
        %{code: "ES", name: "Espírito Santo"},
        %{code: "GO", name: "Goiás"},
        %{code: "MA", name: "Maranhão"},
        %{code: "MG", name: "Minas Gerais"},
        %{code: "MS", name: "Mato Grosso do Sul"},
        %{code: "MT", name: "Mato Grosso"},
        %{code: "PA", name: "Pará"},
        %{code: "PB", name: "Paraíba"},
        %{code: "PE", name: "Pernambuco"},
        %{code: "PI", name: "Piauí"},
        %{code: "PR", name: "Paraná"},
        %{code: "RJ", name: "Rio de Janeiro"},
        %{code: "RN", name: "Rio Grande do Norte"},
        %{code: "RO", name: "Rondônia"},
        %{code: "RR", name: "Roraima"},
        %{code: "RS", name: "Rio Grande do Sul"},
        %{code: "SC", name: "Santa Catarina"},
        %{code: "SE", name: "Sergipe"},
        %{code: "SP", name: "São Paulo"},
        %{code: "TO", name: "Tocantins"}
      ]
  """
  @spec get_states() :: [%{code: String.t(), name: String.t()}]
  def get_states() do
    BrazilianUtils.DataSource.get_states()
  end

  @doc ~S"""
  Check if a given string or number is a valid CEP.

  ## Examples

      iex> BrazilianUtils.is_valid_cep?("77064-620")
      true

      iex> BrazilianUtils.is_valid_cep?(59014590)
      true

      iex> BrazilianUtils.is_valid_cep?("12345-6789")
      false

      iex> BrazilianUtils.is_valid_cep?(1234)
      false
  """
  @spec is_valid_cep?(String.t() | integer()) :: boolean()
  def is_valid_cep?(cep) when is_binary(cep) or is_integer(cep) do
    BrazilianUtils.Cep.is_valid?(cep)
  end

  @doc ~S"""
  Check if a given string is a valid CPF.

  ## Examples

      iex> BrazilianUtils.is_valid_cpf?("658.563.984-75")
      true

      iex> BrazilianUtils.is_valid_cpf?("65856398475")
      true

      iex> BrazilianUtils.is_valid_cpf?("123.456.789-10")
      false

      iex> BrazilianUtils.is_valid_cpf?("658.563.984-00")
      false

      iex> BrazilianUtils.is_valid_cpf?("65856398400")
      false
  """
  @spec is_valid_cpf?(String.t()) :: boolean()
  def is_valid_cpf?(cpf) when is_binary(cpf) do
    BrazilianUtils.Cpf.is_valid?(cpf)
  end

  @doc ~S"""
  Check if a given string is a valid brazilian mobile or landline number.

  ## Examples

      iex> BrazilianUtils.is_valid_phone?("(11) 9 0000-0000")
      true

      iex> BrazilianUtils.is_valid_phone?("11 9 0000 0000")
      true

      iex> BrazilianUtils.is_valid_phone?("11 3000 0000")
      true

      iex> BrazilianUtils.is_valid_phone?("00 9 0000 0000")
      false

      iex> BrazilianUtils.is_valid_phone?("12345")
      false
  """
  @spec is_valid_phone?(String.t()) :: boolean()
  def is_valid_phone?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid?(phone)
  end

  @doc ~S"""
  Check if a given string is a valid brazilian mobile number.

  ## Examples

      iex> BrazilianUtils.is_valid_mobile?("(11) 9 0000-0000")
      true

      iex> BrazilianUtils.is_valid_mobile?("11 9 0000 0000")
      true

      iex> BrazilianUtils.is_valid_mobile?("11900000000")
      true

      iex> BrazilianUtils.is_valid_mobile?("00 9 0000 0000")
      false

      iex> BrazilianUtils.is_valid_mobile?("11 1 0000 0000")
      false

      iex> BrazilianUtils.is_valid_mobile?("1234")
      false
  """
  @spec is_valid_mobile?(String.t()) :: boolean()
  def is_valid_mobile?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid_mobile_phone?(phone)
  end

  @doc ~S"""
  Check if a given string is a valid brazilian landline number.

  ## Examples

      iex> BrazilianUtils.is_valid_landline?("(11) 3000-0000")
      true

      iex> BrazilianUtils.is_valid_landline?("11 3 0000-0000")
      true

      iex> BrazilianUtils.is_valid_landline?("1130000000")
      true

      iex> BrazilianUtils.is_valid_landline?("00 3000 0000")
      false

      iex> BrazilianUtils.is_valid_landline?("11 9 0000 0000")
      false

      iex> BrazilianUtils.is_valid_landline?("1234")
      false
  """
  @spec is_valid_landline?(String.t()) :: boolean()
  def is_valid_landline?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid_landline_phone?(phone)
  end

  @doc ~S"""
  Format CEP (brazilian postal code)

  ## Examples

      iex> BrazilianUtils.format_cep("92500000")
      "92500-000"

      iex> BrazilianUtils.format_cep("9250")
      "9250"

      iex> BrazilianUtils.format_cep("9250000000000")
      "92500-000"

      iex> BrazilianUtils.format_cep("9250as0d0d00fsa0g0000")
      "92500-000"
  """
  @spec format_cep(String.t()) :: String.t()
  def format_cep(cep) when is_binary(cep) do
    BrazilianUtils.Cep.format(cep)
  end

  @doc ~S"""
  Format CPF

  ## Examples

      iex> BrazilianUtils.format_cpf("16561542851")
      "165.615.428-51"

      iex> BrazilianUtils.format_cpf("165615428")
      "165.615.428"

      iex> BrazilianUtils.format_cpf("1656154285100000000")
      "165.615.428-51"

      iex> BrazilianUtils.format_cpf("16sdgs561dsg54!$28sa51")
      "165.615.428-51"
  """
  @spec format_cpf(String.t()) :: String.t()
  def format_cpf(cpf) when is_binary(cpf) do
    BrazilianUtils.Cpf.format(cpf)
  end
end
