defmodule Spell.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:username, :string, null: false)
      add(:password, :string, null: false)

      timestamps()
    end
  end
end
