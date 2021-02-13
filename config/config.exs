use Mix.Config

config :porcelain, :driver, Porcelain.Driver.Basic

config :gamify_bot, token: System.get_env("GAMIFY_BOT_DISCORD_TOKEN")

config :gamify_bot, ecto_repos: [GamifyBot.Repo]

import_config "#{Mix.env()}.exs"
