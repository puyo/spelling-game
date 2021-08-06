defmodule SpellWeb.GameLive do
  use SpellWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{}, conn: socket)}
  end
end
