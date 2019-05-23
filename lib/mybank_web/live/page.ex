defmodule MybankWeb.Page do
  use Phoenix.LiveView

  alias MybankWeb.PageView
  alias Mybank.Token

  def mount(_session, socket) do
    {:ok, assign(socket, errors: %{}, token: nil, accounts: nil, account: nil, transactions: nil)}
  end

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

  def handle_event("validate_token", %{"token" => token}, socket) do
    IO.inspect("validate_token")
    IO.inspect(token)
    {:noreply, assign(socket, errors: %{token: "Invalid token"})}
    #{:noreply, assign(socket)}
  end

  def handle_event("load_accounts", %{"token" => token}, socket) do
    IO.inspect("load_accounts")
    IO.inspect(token)
    {:noreply, assign(socket, token: token, accounts: [ %{id: "uid", description: "description"} ])}
  end

  def handle_event("load_account_details", %{"account_id" => account_id}, socket) do
    IO.inspect("load_account_details")
    IO.inspect(account_id)
    case String.length(account_id) == 0 do
      true  -> {:noreply, assign(socket, errors: %{account_id: "Please select an account"})}
      false -> {:noreply, assign(socket, account: %{id: account_id, description: "description", iban: "iban", amount: "amount"})}
    end
  end

  def handle_event("load_transactions", account_id, socket) do
    IO.inspect("load_transactions")
    IO.inspect(account_id)
    {:noreply, assign(socket, transactions: [
      %{
        id: "uid",
        date: "date",
        counterpart: "counterpart",
        iban: "iban",
        remittance: "remittance",
        amount: "amount"
      }
    ])}
  end

end
