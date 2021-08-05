defmodule SpellingGame.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :performance, :float, null: false
      add :current_difficulty, :float, null: false
      add :current_spacing, :float, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :word_id, references(:words, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:results, [:user_id])
    create index(:results, [:word_id])
  end
end
