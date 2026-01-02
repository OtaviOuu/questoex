defmodule Questoex.Repo do
  use Ecto.Repo,
    otp_app: :questoex,
    adapter: Ecto.Adapters.Postgres
end
