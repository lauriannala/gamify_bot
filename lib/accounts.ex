defmodule GamifyBot.Accounts do
  alias GamifyBot.Accounts.User
  alias GamifyBot.Repo

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_or_create_user(%{name: name} = attrs) do
    if found_user = Repo.get_by(User, %{name: name}) do
      {:ok, found_user}
    else
      create_user(attrs)
    end
  end
end
