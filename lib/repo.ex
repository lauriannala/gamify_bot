defmodule GamifyBot.Repo do
  use Ecto.Repo,
    otp_app: :gamify_bot,
    adapter: Ecto.Adapters.Postgres
end
