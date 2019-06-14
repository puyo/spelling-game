defmodule SpellingGame.Exercises.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :current_difficulty, :float
    field :current_spacing, :float
    field :performance, :float
    field :user_id, :id
    field :word_id, :id

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:performance, :current_difficulty, :current_spacing])
    |> validate_required([:performance, :current_difficulty, :current_spacing])
  end
end
