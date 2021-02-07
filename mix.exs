defmodule GamifyBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :gamify_bot,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [mod: {GamifyBot, []}]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:alchemy, "~> 0.6.7", hex: :discord_alchemy}
    ]
  end
end
