defmodule SpellingGameWeb.ResultController do
  use SpellingGameWeb, :controller

  alias SpellingGame.Exercises
  alias SpellingGame.Exercises.Result

  def index(conn, %{"user_id" => user_id}) do
    results = Exercises.list_results(user_id)
    render(conn, "index.html", user_id: user_id, results: results)
  end

  def new(conn, %{"user_id" => user_id}) do
    changeset = Exercises.change_result(%Result{})
    render(conn, "new.html", user_id: user_id, changeset: changeset)
  end

  def create(conn, %{"user_id" => user_id, "result" => result_params}) do
    case Exercises.create_result(result_params) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Result created successfully.")
        |> redirect(to: Routes.user_result_path(conn, :show, user_id, result))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", user_id: user_id, changeset: changeset)
    end
  end

  def show(conn, %{"user_id" => user_id, "id" => id}) do
    result = Exercises.get_result!(id)
    render(conn, "show.html", user_id: user_id, result: result)
  end

  def edit(conn, %{"user_id" => user_id, "id" => id}) do
    result = Exercises.get_result!(id)
    changeset = Exercises.change_result(result)
    render(conn, "edit.html", user_id: user_id, result: result, changeset: changeset)
  end

  def update(conn, %{"user_id" => user_id, "id" => id, "result" => result_params}) do
    result = Exercises.get_result!(id)

    case Exercises.update_result(result, result_params) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Result updated successfully.")
        |> redirect(to: Routes.user_result_path(conn, :show, user_id, result))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", result: result, changeset: changeset)
    end
  end

  def delete(conn, %{"user_id" => user_id, "id" => id}) do
    result = Exercises.get_result!(id)
    {:ok, _result} = Exercises.delete_result(result)

    conn
    |> put_flash(:info, "Result deleted successfully.")
    |> redirect(to: Routes.user_result_path(conn, :index, user_id))
  end
end
