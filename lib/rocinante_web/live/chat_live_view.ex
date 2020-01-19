defmodule RocinanteWeb.ChatLiveView do
  use Phoenix.LiveView
  alias Rocinante.Chats
  alias RocinanteWeb.Presence

  def render(assigns) do
    RocinanteWeb.ChatView.render("show.html", assigns)
  end

  defp topic(chat_id), do: "chat:#{chat_id}"

  def mount(%{chat: chat, current_user: current_user}, socket) do
    Presence.track(
      self(),
      topic(chat.id),
      current_user.id,
      %{
        first_name: "#{current_user.first_name} #{String.slice(current_user.last_name, 0..0)}",
        email: current_user.email,
        user_id: current_user.id
      }
    )

    RocinanteWeb.Endpoint.subscribe(topic(chat.id))

    users =
      Presence.list(topic(chat.id))
      |> Enum.map(fn {_user_id, data} ->
        data[:metas]
        |> List.first()
      end)

    {:ok,
     assign(socket,
       chat: chat,
       message: Chats.change_message(),
       current_user: current_user,
       users: users
     )}
  end

  def handle_event("message", %{"message" => message_params}, socket) do
    chat = Chats.create_message(message_params)
    RocinanteWeb.Endpoint.broadcast_from(self(), topic(chat.id), "message", %{chat: chat})
    {:noreply, assign(socket, chat: chat, message: Chats.change_message())}
  end

  def handle_info(%{event: "message", payload: state}, socket) do
    {:noreply, assign(socket, state)}
  end

  def handle_info(
        %{event: "presence_diff", payload: _payload},
        socket = %{assigns: %{chat: chat}}
      ) do
    users =
      Presence.list(topic(chat.id))
      |> Enum.map(fn {_user_id, data} ->
        data[:metas]
        |> List.first()
      end)

    {:noreply, assign(socket, users: users)}
  end
end
