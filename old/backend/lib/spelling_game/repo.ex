defmodule SpellingGame.Repo do
  use Ecto.Repo,
    otp_app: :spelling_game,
    adapter: Ecto.Adapters.Postgres
end
