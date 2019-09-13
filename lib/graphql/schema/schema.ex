defmodule Graphql.Schema do
  use Absinthe.Schema
  import_types(Graphql.Schema.Types)

  query do
    field :orders, list_of(:order) do
      resolve(&Orders.Controllers.Orders.all/2)
    end

    field :products, list_of(:product) do
      resolve(&Orders.Controllers.Products.all/2)
    end

    field :payments, list_of(:payment) do
      resolve(&Orders.Controllers.Payments.all/2)
    end
  end

  mutation do
    field :make_payment, :payment do
      arg(:amount, non_null(:integer))
      arg(:order_id, non_null(:id))

      resolve(&Orders.Controllers.Payments.make_payment/2)
    end

    field :create_order, :order do
      arg(:product_ids, list_of(:id))

      resolve(&Orders.Controllers.Orders.create_order/2)
    end
  end
end
