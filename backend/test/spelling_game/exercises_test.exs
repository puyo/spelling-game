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

  describe "results" do
    alias SpellingGame.Exercises.Result

    @valid_attrs %{current_difficulty: 120.5, current_spacing: 120.5, performance: 120.5}
    @update_attrs %{current_difficulty: 456.7, current_spacing: 456.7, performance: 456.7}
    @invalid_attrs %{current_difficulty: nil, current_spacing: nil, performance: nil}

    def result_fixture(attrs \\ %{}) do
      {:ok, result} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Exercises.create_result()

      result
    end

    test "list_results/0 returns all results" do
      result = result_fixture()
      assert Exercises.list_results() == [result]
    end

    test "get_result!/1 returns the result with given id" do
      result = result_fixture()
      assert Exercises.get_result!(result.id) == result
    end

    test "create_result/1 with valid data creates a result" do
      assert {:ok, %Result{} = result} = Exercises.create_result(@valid_attrs)
      assert result.current_difficulty == 120.5
      assert result.current_spacing == 120.5
      assert result.performance == 120.5
    end

    test "create_result/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exercises.create_result(@invalid_attrs)
    end

    test "update_result/2 with valid data updates the result" do
      result = result_fixture()
      assert {:ok, %Result{} = result} = Exercises.update_result(result, @update_attrs)
      assert result.current_difficulty == 456.7
      assert result.current_spacing == 456.7
      assert result.performance == 456.7
    end

    test "update_result/2 with invalid data returns error changeset" do
      result = result_fixture()
      assert {:error, %Ecto.Changeset{}} = Exercises.update_result(result, @invalid_attrs)
      assert result == Exercises.get_result!(result.id)
    end

    test "delete_result/1 deletes the result" do
      result = result_fixture()
      assert {:ok, %Result{}} = Exercises.delete_result(result)
      assert_raise Ecto.NoResultsError, fn -> Exercises.get_result!(result.id) end
    end

    test "change_result/1 returns a result changeset" do
      result = result_fixture()
      assert %Ecto.Changeset{} = Exercises.change_result(result)
    end
  end

  describe "words" do
    alias SpellingGame.Exercises.Word

    @valid_attrs %{difficulty: 120.5, prompt: "some prompt", word: "some word"}
    @update_attrs %{difficulty: 456.7, prompt: "some updated prompt", word: "some updated word"}
    @invalid_attrs %{difficulty: nil, prompt: nil, word: nil}

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
      assert word.difficulty == 120.5
      assert word.prompt == "some prompt"
      assert word.word == "some word"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exercises.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      assert {:ok, %Word{} = word} = Exercises.update_word(word, @update_attrs)
      assert word.difficulty == 456.7
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
