defmodule SpellingGame.Exercises.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :prompt, :string
    field :word, :string

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:word, :prompt])
    |> validate_required([:word, :prompt])
  end
end
