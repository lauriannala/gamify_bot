defmodule GamifyBot.Repo.Migrations.CreateChoresTable do
  use Ecto.Migration

  def change do
    create table(:chores) do
      add(:name, :string)
      add(:duration, :integer)
      add(:user_id, references(:users))

      timestamps()
    end
  end
end
