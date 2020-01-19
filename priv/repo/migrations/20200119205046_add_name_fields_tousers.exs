defmodule Rocinante.Repo.Migrations.AddNameFieldsTousers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string, null: false, default: "Anonymous"
      add :last_name, :string, null: false, default: "Guest"
    end
  end
end
