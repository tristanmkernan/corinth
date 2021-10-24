defmodule Corinth.Repo do
  use Ecto.Repo,
    otp_app: :corinth,
    adapter: Ecto.Adapters.Postgres
end
