defmodule Orders.Models.Product do
    use Ecto.Schema
    import Ecto.Changeset
  
    alias Orders.Models.Order
  
    @primary_key {:id, :id, autogenerate: true}
    schema "products" do
      field :name, :string
      field :price, :integer
      field :description, :string
      many_to_many :orders, Order, join_through: "order_products"
  
      timestamps()
    end
  
  
    def changeset(data, params \\ %{}) do
      data
      |> cast(params, [:name, :price, :description])
      |> validate_required([:name, :price, :description])
      |> validate_number(:price, greater_than_or_equal_to: 0)
    end
  end