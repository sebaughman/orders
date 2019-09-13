defmodule Orders.Controllers.Products do
  alias Orders.Resolvers.Products

  def index(_args, _info) do
    {:ok, Products.get_products()}
  end
end
