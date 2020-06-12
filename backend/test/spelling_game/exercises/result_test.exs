defmodule SpellingGame.ResultTest do
  use SpellingGame.DataCase

  alias SpellingGame.Exercises
  alias SpellingGame.Exercises.Result

  test "list_results/0 returns all results" do
    create_fixtures([
      fixture(:user),
      fixture(:word),
      fixture(:result)
    ])

    assert [%Result{id: 1000}] = Exercises.list_results(10)
  end

  test "get_result!/1 returns the result with given id" do
    [_, _, result] =
      create_fixtures([
        fixture(:user),
        fixture(:word),
        fixture(:result)
      ])

    assert %Result{id: 1000} = Exercises.get_result!(result.id)
  end

  test "create_result/1 with valid data creates a result" do
    create_fixtures([
      fixture(:user),
      fixture(:word)
    ])

    assert {:ok, %Result{} = result} =
             Exercises.create_result(%{
               user_id: 10,
               word_id: 100,
               current_difficulty: 120.5,
               current_spacing: 120.5,
               performance: 120.5
             })

    assert result.current_difficulty == 120.5
    assert result.current_spacing == 120.5
    assert result.performance == 120.5
  end

  test "create_result/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Exercises.create_result(%{})
  end

  test "update_result/2 with valid data updates the result" do
    [_, _, result] =
      create_fixtures([
        fixture(:user),
        fixture(:word),
        fixture(:result)
      ])

    assert {:ok, %Result{} = result} =
             Exercises.update_result(result, %{
               current_difficulty: 456.7,
               current_spacing: 456.7,
               performance: 456.7
             })

    assert result.current_difficulty == 456.7
    assert result.current_spacing == 456.7
    assert result.performance == 456.7
  end

  test "update_result/2 with invalid data returns error changeset" do
    [_, _, result] =
      create_fixtures([
        fixture(:user),
        fixture(:word),
        fixture(:result)
      ])

    assert {:error, %Ecto.Changeset{}} = Exercises.update_result(result, %{word_id: nil})

    assert %Result{id: 1000} = Exercises.get_result!(result.id)
  end

  test "delete_result/1 deletes the result" do
    [_, _, result] =
      create_fixtures([
        fixture(:user),
        fixture(:word),
        fixture(:result)
      ])

    assert {:ok, %Result{}} = Exercises.delete_result(result)
    assert from(Result) |> Repo.all() == []
  end

  test "change_result/1 returns a result changeset" do
    [_, _, result] =
      create_fixtures([
        fixture(:user),
        fixture(:word),
        fixture(:result)
      ])

    assert %Ecto.Changeset{} = Exercises.change_result(result)
  end
end
