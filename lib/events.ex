  defmodule GamifyBot.Events do
    use Alchemy.Events

    Events.on_message(:inspect)
    def inspect(message) do
      IO.inspect message

      case message.author.username do
        "gamify_bot" -> IO.puts "Message received, but I should probably not talk to myself."
        _ -> message_command(message)
      end
    end

    def message_command(message) do
      commands = String.split(message.content, " ")
      case commands do
        ["chore" | rest] -> chore_command(message, rest)
        ["gamify_bot" | ["help" | _]] -> help_message(message)
        _ -> unknown_command(message)
      end
    end

    def chore_command(message, [command | rest]) do
      case command do
        "done" ->
          message_back(message, "Saving chore with: #{Enum.join(rest, ", ")}")
        _ -> unknown_command(message)
      end
    end

    def chore_command(message, []), do: unknown_command(message)

    def unknown_command(message) do
      IO.puts "Unknown message received, responding.."
      message_back(
        message,
        "Hello there, #{message.author.username}! Sorry, but I don't understand what you mean by saying: #{message.content}, for help, type: gamify_bot help")
    end

    def help_message(message) do
      message_back(message, "To save chore, type: chore done <chore name> <duration in minutes>")
    end

    def message_back(message, content) do
      GamifyBot.Commands.message(%{
        channel_id: message.channel_id
      }, content)
    end
  end
