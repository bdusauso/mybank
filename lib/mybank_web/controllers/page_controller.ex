defmodule MybankWeb.PageController do
  use MybankWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
