defmodule Spell.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add(:word, :string, null: false)
      add(:prompt, :string, null: false)
      add(:difficulty, :float, null: false)

      timestamps()
    end
  end
end
