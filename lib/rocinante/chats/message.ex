defmodule Rocinante.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rocinante.Chats.Chat
  alias Rocinante.Users.User

  schema "messages" do
    belongs_to :chat, Chat
    belongs_to :user, User
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:chat_id, :content, :user_id])
    |> validate_required([:chat_id, :content, :user_id])
  end
end
