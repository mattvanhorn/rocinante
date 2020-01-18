defmodule Rocinante.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :title, :string
    field :description, :string
    field :starts_at, :naive_datetime
    field :ends_at, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :starts_at, :ends_at])
    |> validate_required([:title, :description, :starts_at, :ends_at])
    |> strip_unsafe_desc(attrs)
  end

  defp strip_unsafe_desc(event, %{"desc" => nil}) do
    event
  end

  defp strip_unsafe_desc(event, %{"desc" => desc}) do
    {:safe, clean_desc} = Phoenix.HTML.html_escape(desc)
    event |> put_change(:desc, clean_desc)
  end

  defp strip_unsafe_desc(event, _) do
    event
  end
end
