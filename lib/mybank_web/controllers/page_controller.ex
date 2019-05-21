defmodule MybankWeb.PageController do
  use MybankWeb, :controller

  alias Phoenix.LiveView
  alias MybankWeb.Page

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, Page, session: %{})
  end
end
