defmodule SpellingGame.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :word, :string
      add :prompt, :string
      add :difficulty, :float

      timestamps()
    end

  end
end
