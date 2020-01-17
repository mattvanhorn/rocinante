defmodule Rocinante.Repo do
  use Ecto.Repo,
    otp_app: :rocinante,
    adapter: Ecto.Adapters.Postgres
end
