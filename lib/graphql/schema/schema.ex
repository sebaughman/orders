defmodule Graphql.Schema do
  use Absinthe.Schema
  import_types(Graphql.Schema.Types)

  query do
    field :orders, list_of(:order) do
      resolve(&Orders.Controllers.Orders.index/2)
    end

    field :products, list_of(:product) do
      resolve(&Orders.Controllers.Products.index/2)
    end

    field :payments, list_of(:payment) do
      resolve(&Orders.Controllers.Payments.index/2)
    end
  end

  mutation do
    field :make_payment, :payment do
      arg(:amount, non_null(:integer))
      arg(:order_id, non_null(:id))

      resolve(&Orders.Controllers.Payments.create/2)
    end

    field :create_order, :order do
      arg(:product_ids, list_of(:id))

      resolve(&Orders.Controllers.Orders.create/2)
    end
  end
end
