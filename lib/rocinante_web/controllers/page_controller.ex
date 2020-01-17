defmodule RocinanteWeb.PageController do
  use RocinanteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
