  defmodule GamifyBot.Commands do
    use Alchemy.Cogs

    Cogs.def ping do
      Cogs.say "pong!"
    end

    Cogs.def message(content) do
      Cogs.say content
    end
  end
