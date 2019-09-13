defmodule Graphql.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Orders.Repo

  object :order do
    field(:id, :id)
    field(:total, :integer)
    field(:balance, :integer)
    field(:description, :string)
    field(:products, list_of(:product), resolve: assoc(:products))
    field(:payments, list_of(:payment), resolve: assoc(:payments))
  end

  object :product do
    field(:id, :id)
    field(:name, :string)
    field(:price, :integer)
    field(:description, :string)
    field(:orders, list_of(:order), resolve: assoc(:orders))
  end

  object :payment do
    field(:id, :id)
    field(:amount, :integer)
    field(:note, :string)
    field(:order_id, :id, resolve: assoc(:category))
  end
end
