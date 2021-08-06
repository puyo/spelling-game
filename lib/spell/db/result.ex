defmodule Spell.Db.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field(:current_difficulty, :float)
    field(:current_spacing, :float)
    field(:performance, :float)

    belongs_to(:user, Spell.Db.User)
    belongs_to(:word, Spell.Db.Word)

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:user_id, :word_id, :performance, :current_difficulty, :current_spacing])
    |> validate_required([:user_id, :word_id, :performance, :current_difficulty, :current_spacing])
    |> foreign_key_constraint(:user_id, name: "results_user_id_fkey")
    |> foreign_key_constraint(:word_id, name: "results_word_id_fkey")
  end
end
