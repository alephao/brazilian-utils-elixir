defmodule BrazilianUtils.MixProject do
  use Mix.Project

  def project do
    [
      app: :brazilian_utils,
      version: "0.2.0",
      description: "Utilities library for Brazilian Businesses",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ] ++ docs()
  end

  defp deps do
    [
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      maintainers: ["Aleph Retamal"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/alephao/brazilian-utils-elixir"}
    ]
  end

  defp docs() do
    [
      name: "BrazilianUtils",
      source_url: "https://github.com/alephao/brazilian-utils-elixir",
      docs: [
        # The main page in the docs
        main: "BrazilianUtils",
        extras: ["README.md"]
      ]
    ]
  end
end
