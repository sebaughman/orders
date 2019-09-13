defmodule Orders.Models.Payment do
  use Orders.Schema
  import Ecto.Changeset

  alias Orders.Models.Order

  schema "payments" do
    field(:amount, :integer)
    field(:note, :string)
    belongs_to(:order, Order, type: :binary_id)

    timestamps()
  end

  @fields ~w(amount note order_id)

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:amount, :order_id])
    |> validate_number(:amount, greater_than: 0)
  end
end
