defmodule GamifyBotTest do
  use ExUnit.Case
  doctest GamifyBot

  test "greets the world" do
    assert GamifyBot.hello() == :world
  end
end
