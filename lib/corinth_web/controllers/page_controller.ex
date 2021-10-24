defmodule CorinthWeb.PageController do
  use CorinthWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
