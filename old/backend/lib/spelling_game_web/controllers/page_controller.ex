defmodule SpellingGameWeb.PageController do
  use SpellingGameWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
