defmodule MybankWeb.Page do
  use Phoenix.LiveView

  alias MybankWeb.PageView
  alias Mybank.Token

  def mount(_session, socket) do
    changeset = Token.changeset(%Token{})
    {:ok, assign(socket, changeset: changeset, action: nil, accounts: nil, account: nil, transactions: nil)}
  end

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

  def handle_event("validate_token", %{"token" => token}, socket) do
    IO.inspect("validate_token")
    IO.inspect(token)
    {:noreply, assign(socket, valid_token: true)}
  end

  def handle_event("load_accounts", %{"token" => token}, socket) do
    IO.inspect("load_accounts")
    IO.inspect(token)
    {:noreply, assign(socket, accounts: [ %{id: "uid", description: "description"} ])}
  end

end
