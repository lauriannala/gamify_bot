defmodule GamifyBot.Tasks.Chore do
  use Ecto.Schema
  import Ecto.Changeset
  alias GamifyBot.Accounts.User

  schema "chores" do
    field :name, :string
    field :duration, :integer
    belongs_to :user, User

    timestamps()
  end

  def changeset(chore, attrs) do
    chore
    |> cast(attrs, [:name, :duration])
    |> validate_required([:name, :duration])
  end

  def changeset_with_user(chore, user) do
    chore
    |> change()
    |> put_assoc(:user, user)
  end
end
