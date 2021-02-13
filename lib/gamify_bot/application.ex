defmodule GamifyBot.Application do
  use Application
  alias Alchemy.Client

  def start(_type, _args) do
    children = [
      GamifyBot.Repo,
    ]
    opts = [strategy: :one_for_one, name: GamifyBot.Supervisor]
    Supervisor.start_link(children, opts)


    token = Application.fetch_env!(:gamify_bot, :token)
    run = Client.start(token)
    use GamifyBot.Commands
    use GamifyBot.Events
    run
  end
end
