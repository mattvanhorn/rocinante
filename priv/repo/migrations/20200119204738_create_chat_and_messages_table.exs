defmodule Rocinante.Repo.Migrations.CreateChatAndMessagesTable do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :room_name, :string, null: false
      timestamps()
    end

    create unique_index(:chats, [:room_name])

    create table(:messages) do
      add :chat_id, :integer
      add :content, :text
      add :user_id, :integer

      timestamps()
    end
  end
end
