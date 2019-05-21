defmodule MybankWeb.Page do
  use Phoenix.LiveView

  alias MybankWeb.PageView

  def mount(_session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

end
