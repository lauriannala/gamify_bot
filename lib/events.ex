  defmodule GamifyBot.Events do
    use Alchemy.Events

    Events.on_message(:inspect)
    def inspect(message) do
      IO.inspect message

      case message.author.username do
        "gamify_bot" -> IO.puts "Message received, but I should probably not talk to myself."
        _ ->
          IO.puts "Message received, responding.."
          GamifyBot.Commands.message(%{
            channel_id: message.channel_id
          }, "Hello there, #{message.author.username}! Sorry, but I don't understand what you mean by saying: #{message.content}")
      end

    end
  end
