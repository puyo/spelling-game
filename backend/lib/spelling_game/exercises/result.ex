defmodule SpellingGame.Exercises.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :current_difficulty, :float
    field :current_spacing, :float
    field :performance, :float
    # field :user_id, :id
    # field :word_id, :id

    belongs_to :user, SpellingGame.Auth.User
    belongs_to :word, SpellingGame.Exercises.Word

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:user_id, :word_id, :performance, :current_difficulty, :current_spacing])
    |> validate_required([:user_id, :word_id, :performance, :current_difficulty, :current_spacing])
  end
end
