defmodule MusicBox.Tracks.Track do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicBox.Tracks.Track


  schema "tracks" do
    field :artist, :string
    field :file_path, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Track{} = track, attrs) do
    track
    |> cast(attrs, [:name, :artist, :file_path])
    |> validate_required([:name, :artist, :file_path])
  end
end
