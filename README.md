# GamifyBot

Bot for tracking tasks submittd by users.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gamify_bot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gamify_bot, "~> 0.1.0"}
  ]
end
```

# Database
* Copy docker-compose configuration: `cp database/docker-compose.example.yml database/docker-compose.yml`
* Set database secrets
* Run docker: `cd database && docker-compose up`

# Development
* Copy dev configuration template: `cp config/dev.exs.example config/dev.exs`
* Setup database configuration in this file
* Run application with `iex -S mix`

## Testing
* Run application with `iex -S mix`
* Execute commands, eg:
 * `GamifyBot.Commands.ping(%{channel_id: "<channgel_id>"})`
 * `GamifyBot.Commands.message(%{channel_id: "<channel_id>"}, "Hello, this is gamify_bot")`


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/gamify_bot](https://hexdocs.pm/gamify_bot).

