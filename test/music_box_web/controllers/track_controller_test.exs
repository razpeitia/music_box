defmodule MusicBoxWeb.TrackControllerTest do
  use MusicBoxWeb.ConnCase

  alias MusicBox.Tracks
  alias MusicBox.Tracks.Track

  @create_attrs %{artist: "some artist", file_path: "some file_path", name: "some name"}
  @update_attrs %{artist: "some updated artist", file_path: "some updated file_path", name: "some updated name"}
  @invalid_attrs %{artist: nil, file_path: nil, name: nil}

  def fixture(:track) do
    {:ok, track} = Tracks.create_track(@create_attrs)
    track
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tracks", %{conn: conn} do
      conn = get conn, track_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create track" do
    test "renders track when data is valid", %{conn: conn} do
      conn = post conn, track_path(conn, :create), track: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, track_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "artist" => "some artist",
        "file_path" => "some file_path",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, track_path(conn, :create), track: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update track" do
    setup [:create_track]

    test "renders track when data is valid", %{conn: conn, track: %Track{id: id} = track} do
      conn = put conn, track_path(conn, :update, track), track: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, track_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "artist" => "some updated artist",
        "file_path" => "some updated file_path",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, track: track} do
      conn = put conn, track_path(conn, :update, track), track: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete track" do
    setup [:create_track]

    test "deletes chosen track", %{conn: conn, track: track} do
      conn = delete conn, track_path(conn, :delete, track)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, track_path(conn, :show, track)
      end
    end
  end

  defp create_track(_) do
    track = fixture(:track)
    {:ok, track: track}
  end
end
