defmodule MusicBox.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :name, :string
      add :artist, :string
      add :file_path, :string

      timestamps()
    end

  end
end
