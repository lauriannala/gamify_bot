defmodule GamifyBot.Tasks do
  alias GamifyBot.Tasks.Chore
  alias GamifyBot.Repo

  def create_chore(attrs \\ %{}, user) do
    IO.inspect attrs
    %Chore{}
    |> Chore.changeset(attrs)
    |> Chore.changeset_with_user(user)
    |> Repo.insert
  end
end
