defmodule SpellingGameWeb.WordController do
  use SpellingGameWeb, :controller

  alias SpellingGame.Exercises
  alias SpellingGame.Exercises.Word

  def index(conn, _params) do
    words = Exercises.list_words()
    render(conn, "index.html", words: words)
  end

  def new(conn, _params) do
    changeset = Exercises.change_word(%Word{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"word" => word_params}) do
    case Exercises.create_word(word_params) do
      {:ok, word} ->
        conn
        |> put_flash(:info, "Word created successfully.")
        |> redirect(to: Routes.word_path(conn, :show, word))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    word = Exercises.get_word!(id)
    render(conn, "show.html", word: word)
  end

  def edit(conn, %{"id" => id}) do
    word = Exercises.get_word!(id)
    changeset = Exercises.change_word(word)
    render(conn, "edit.html", word: word, changeset: changeset)
  end

  def update(conn, %{"id" => id, "word" => word_params}) do
    word = Exercises.get_word!(id)

    case Exercises.update_word(word, word_params) do
      {:ok, word} ->
        conn
        |> put_flash(:info, "Word updated successfully.")
        |> redirect(to: Routes.word_path(conn, :show, word))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", word: word, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    word = Exercises.get_word!(id)
    {:ok, _word} = Exercises.delete_word(word)

    conn
    |> put_flash(:info, "Word deleted successfully.")
    |> redirect(to: Routes.word_path(conn, :index))
  end
end
