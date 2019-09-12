defmodule Orders.Models.Payment do
    use Ecto.Schema
    import Ecto.Changeset
  
    alias Orders.Models.Order
  
    @primary_key {:id, :id, autogenerate: true}
    schema "payments" do
      field :amount, :integer
      field :note, :string
      belongs_to :order, Order, type: :id
  
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