defmodule BrazilianUtils do

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

  @spec is_valid_phone?(String.t()) :: boolean()
  def is_valid_phone?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid?(phone)
  end

  @spec is_valid_mobile?(String.t()) :: boolean()
  def is_valid_mobile?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid_mobile_phone?(phone)
  end

  @spec is_valid_landline?(String.t()) :: boolean()
  def is_valid_landline?(phone) when is_binary(phone) do
    BrazilianUtils.Phone.is_valid_landline_phone?(phone)
  end
end
