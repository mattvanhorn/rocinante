defmodule Rocinante.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :text
      add :starts_at, :naive_datetime
      add :ends_at, :naive_datetime

      timestamps()
    end
  
  end
end
