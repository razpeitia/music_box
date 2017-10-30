defmodule MusicBoxWeb.TrackView do
  use MusicBoxWeb, :view
  alias MusicBoxWeb.TrackView

  def render("index.json", %{tracks: tracks}) do
    %{data: render_many(tracks, TrackView, "track.json")}
  end

  def render("show.json", %{track: track}) do
    %{data: render_one(track, TrackView, "track.json")}
  end

  def render("track.json", %{track: track}) do
    %{id: track.id,
      name: track.name,
      artist: track.artist,
      file_path: track.file_path,
      inserted_at: track.inserted_at,
      updated_at: track.updated_at}
  end
end
