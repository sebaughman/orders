defmodule Orders.Controllers.Orders do
  alias Orders.Resolvers.Orders

  def all(_args, _info) do
    {:ok, Orders.get_all_orders()}
  end

  def create_order(%{product_ids: product_ids}, _info) do
    Orders.create_order(product_ids)
  end
end
