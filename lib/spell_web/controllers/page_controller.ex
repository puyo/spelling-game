defmodule SpellWeb.PageController do
  use SpellWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
