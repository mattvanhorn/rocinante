defmodule Rocinante.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Rocinante.Repo

  alias Rocinante.Events.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  def fetch_events(starts_at, ends_at) do
    {:ok, starts_at, _} = DateTime.from_iso8601(starts_at)
    {:ok, ends_at, _} = DateTime.from_iso8601(ends_at)

    Repo.all(
      Event
      |> where([evt], fragment("? BETWEEN ? AND ?", evt.starts_at, ^starts_at, ^ends_at))
    )
  end

  def to_calendar_events(events) do
    Enum.map(events, fn evt ->
      %{
        id: evt.id,
        groupId: "groupId",
        start: evt.starts_at,
        end: evt.ends_at,
        title: evt.title,
        url: "/events/#{evt.id}",
        editable: false,
        extendedProps: %{}
      }
    end)
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{source: %Event{}}

  """
  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end
end
