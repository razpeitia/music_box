defmodule MusicBoxWeb.PageController do
  use MusicBoxWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
