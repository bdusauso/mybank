defmodule Mybank.Token do
  use Ecto.Schema

  import Ecto.Changeset

  schema "tokens" do
    field :token
  end

  def changeset(token, params \\ %{}) do
    cast(token, params, [:token])
  end

end