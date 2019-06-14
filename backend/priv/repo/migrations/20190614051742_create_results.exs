defmodule SpellingGame.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :performance, :float
      add :current_difficulty, :float
      add :current_spacing, :float
      add :user_id, references(:users, on_delete: :nothing)
      add :word_id, references(:words, on_delete: :nothing)

      timestamps()
    end

    create index(:results, [:user_id])
    create index(:results, [:word_id])
  end
end
