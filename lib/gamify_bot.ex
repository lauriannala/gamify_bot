defmodule GamifyBot do
  use Application
  alias Alchemy.Client

  def start(_type, _args) do
    token = Application.fetch_env!(:gamify_bot, :token)
    run = Client.start(token)
    use GamifyBot.Commands
    use GamifyBot.Events
    run
  end
end
