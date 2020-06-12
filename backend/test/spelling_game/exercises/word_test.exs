defmodule SpellingGame.Exercsies.WordTest do
  use SpellingGame.DataCase

  alias SpellingGame.Exercises
  alias SpellingGame.Exercises.Word

  test "list_words/0 returns all words" do
    word = create_fixture(:word)
    assert Exercises.list_words() == [word]
  end

  test "get_word!/1 returns the word with given id" do
    word = create_fixture(:word)
    assert Exercises.get_word!(word.id) == word
  end

  test "create_word/1 with valid data creates a word" do
    assert {:ok, %Word{} = word} =
             Exercises.create_word(%{word: "some word", prompt: "some prompt", difficulty: 120.5})

    assert word.difficulty == 120.5
    assert word.prompt == "some prompt"
    assert word.word == "some word"
  end

  test "create_word/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Exercises.create_word(%{})
  end

  test "update_word/2 with valid data updates the word" do
    word = create_fixture(:word)
    assert {:ok, %Word{} = word} = Exercises.update_word(word, %{})
    assert word.difficulty == 456.7
    assert word.prompt == "some updated prompt"
    assert word.word == "some updated word"
  end

  test "update_word/2 with invalid data returns error changeset" do
    word = create_fixture(:word)
    assert {:error, %Ecto.Changeset{}} = Exercises.update_word(word, %{word: nil})
    assert word == Exercises.get_word!(word.id)
  end

  test "delete_word/1 deletes the word" do
    word = create_fixture(:word)
    assert {:ok, %Word{}} = Exercises.delete_word(word)
    assert_raise Ecto.NoResultsError, fn -> Exercises.get_word!(word.id) end
  end

  test "change_word/1 returns a word changeset" do
    word = create_fixture(:word)
    assert %Ecto.Changeset{} = Exercises.change_word(word)
  end
end
