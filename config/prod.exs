use Mix.Config

config :gamify_bot, GamifyBot.Repo,
  database: "gamify",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
