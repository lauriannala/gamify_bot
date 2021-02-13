  defmodule GamifyBot.Events do
    use Alchemy.Events
    alias GamifyBot.Tasks
    alias GamifyBot.Accounts

    Events.on_message(:inspect)
    def inspect(message) do
      IO.inspect message

      case message.author.username do
        _ -> message_command(message)
      end
    end

    def message_command(message) do
      commands = String.split(message.content, " ")
      case commands do
        ["chore" | rest] -> chore_command(message, rest)
        ["Chore" | rest] -> chore_command(message, rest)
        ["gamify_bot" | ["help" | _]] -> help_message(message)
        _ -> unknown_command(message)
      end
    end

    def chore_command(message, [command | rest]) do
      case command do
        "done" ->
          save_chore(message, rest)
          message_back(message, "Saved chore with: #{Enum.join(rest, ", ")}")
        _ -> unknown_command(message)
      end
    end

    def chore_command(message, []), do: unknown_command(message)

    def unknown_command(_) do
      IO.puts "Unknown message received"
    end

    def help_message(message) do
      message_back(message, "To save chore, type: chore done <chore name> <duration in minutes>")
    end

    def message_back(message, content) do
      GamifyBot.Commands.message(%{
        channel_id: message.channel_id
      }, content)
    end

    def save_chore(message, attrs) do
      {:ok, user} = Accounts.get_or_create_user(%{name: message.author.username})

      [name, duration] = attrs
      Tasks.create_chore(%{
        user: user.id,
        name: name,
        duration: duration
      }, user)
    end
  end
