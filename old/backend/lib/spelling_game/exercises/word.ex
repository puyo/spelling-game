defmodule SpellingGame.Exercises.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :difficulty, :float
    field :prompt, :string
    field :word, :string

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:word, :prompt, :difficulty])
    |> validate_required([:word, :prompt, :difficulty])
  end
end
