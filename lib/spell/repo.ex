defmodule Spell.Repo do
  use Ecto.Repo,
    otp_app: :spell,
    adapter: Ecto.Adapters.Postgres
end
