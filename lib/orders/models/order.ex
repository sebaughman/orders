defmodule Orders.Models.Order do
    use Ecto.Schema
    import Ecto.Changeset
  
    alias Orders.Models.Product
    alias Orders.Models.Payment
  
    @primary_key {:id, :id, autogenerate: true}
    schema "orders" do
      field :total, :integer
      field :balance, :integer
      field :description, :string
      many_to_many :products, Product, join_through: "order_products"
      has_many :payments, Payment, on_delete: :delete_all
  
      timestamps()
    end
  
    @fields ~w(total balance description)
  
    def changeset(data, params \\ %{}) do
      data
      |> cast(params, @fields)
      |> validate_required([:total, :balance, :description])
    end
  end