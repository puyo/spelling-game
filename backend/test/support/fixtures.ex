defmodule SpellingGame.Fixtures do
  alias SpellingGame.Repo

  def create_fixtures(fixtures, repo \\ Repo) when is_list(fixtures) do
    for fixture <- fixtures, do: repo.insert!(fixture)
  end

  def create_fixture(type, opts \\ [], repo \\ Repo) when is_atom(type) do
    type
    |> fixture(opts)
    |> repo.insert!()
  end

  def fixture(type, opts \\ [])

  def fixture(:user, opts) do
    %SpellingGame.Auth.User{id: 10, username: "test", password: "1234"} |> with_opts(opts)
  end

  def fixture(:word, opts) do
    %SpellingGame.Exercises.Word{
      id: 100,
      difficulty: 456.7,
      prompt: "some updated prompt",
      word: "some updated word"
    }
    |> with_opts(opts)
  end

  def fixture(:result, opts) do
    %SpellingGame.Exercises.Result{
      id: 1000,
      user_id: 10,
      word_id: 100,
      current_difficulty: 120.5,
      current_spacing: 120.5,
      performance: 120.5
    }
    |> with_opts(opts)
  end

  defp with_opts(struct, opts) do
    Map.merge(struct, Enum.into(opts, %{}))
  end
end
