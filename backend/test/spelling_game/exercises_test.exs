defmodule SpellingGame.ExercisesTest do
  use SpellingGame.DataCase

  alias SpellingGame.Exercises

  describe "words" do
    alias SpellingGame.Exercises.Word

    @valid_attrs %{prompt: "some prompt", word: "some word"}
    @update_attrs %{prompt: "some updated prompt", word: "some updated word"}
    @invalid_attrs %{prompt: nil, word: nil}

    def word_fixture(attrs \\ %{}) do
      {:ok, word} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Exercises.create_word()

      word
    end

    test "list_words/0 returns all words" do
      word = word_fixture()
      assert Exercises.list_words() == [word]
    end

    test "get_word!/1 returns the word with given id" do
      word = word_fixture()
      assert Exercises.get_word!(word.id) == word
    end

    test "create_word/1 with valid data creates a word" do
      assert {:ok, %Word{} = word} = Exercises.create_word(@valid_attrs)
      assert word.prompt == "some prompt"
      assert word.word == "some word"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exercises.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      assert {:ok, %Word{} = word} = Exercises.update_word(word, @update_attrs)
      assert word.prompt == "some updated prompt"
      assert word.word == "some updated word"
    end

    test "update_word/2 with invalid data returns error changeset" do
      word = word_fixture()
      assert {:error, %Ecto.Changeset{}} = Exercises.update_word(word, @invalid_attrs)
      assert word == Exercises.get_word!(word.id)
    end

    test "delete_word/1 deletes the word" do
      word = word_fixture()
      assert {:ok, %Word{}} = Exercises.delete_word(word)
      assert_raise Ecto.NoResultsError, fn -> Exercises.get_word!(word.id) end
    end

    test "change_word/1 returns a word changeset" do
      word = word_fixture()
      assert %Ecto.Changeset{} = Exercises.change_word(word)
    end
  end
end
