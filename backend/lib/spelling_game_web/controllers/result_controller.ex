defmodule SpellingGameWeb.ResultController do
  use SpellingGameWeb, :controller

  alias SpellingGame.Exercises
  alias SpellingGame.Exercises.Result

  def index(conn, _params) do
    results = Exercises.list_results()
    render(conn, "index.html", results: results)
  end

  def new(conn, _params) do
    changeset = Exercises.change_result(%Result{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"result" => result_params}) do
    case Exercises.create_result(result_params) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Result created successfully.")
        |> redirect(to: Routes.result_path(conn, :show, result))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    result = Exercises.get_result!(id)
    render(conn, "show.html", result: result)
  end

  def edit(conn, %{"id" => id}) do
    result = Exercises.get_result!(id)
    changeset = Exercises.change_result(result)
    render(conn, "edit.html", result: result, changeset: changeset)
  end

  def update(conn, %{"id" => id, "result" => result_params}) do
    result = Exercises.get_result!(id)

    case Exercises.update_result(result, result_params) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Result updated successfully.")
        |> redirect(to: Routes.result_path(conn, :show, result))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", result: result, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    result = Exercises.get_result!(id)
    {:ok, _result} = Exercises.delete_result(result)

    conn
    |> put_flash(:info, "Result deleted successfully.")
    |> redirect(to: Routes.result_path(conn, :index))
  end
end
