defmodule Orders.Controllers.Orders do
  alias Orders.Resolvers.Orders

  def index(_args, _info) do
    {:ok, Orders.get_all_orders()}
  end

  def create(%{product_ids: product_ids}, _info) do
    Orders.create_order(product_ids)
  end
end
