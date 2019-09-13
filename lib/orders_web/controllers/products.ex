defmodule Orders.Controllers.Products do
  alias Orders.Resolvers.Products

  def all(_args, _info) do
    {:ok, Products.get_products()}
  end
end
