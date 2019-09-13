defmodule Orders.Resolvers.Products do
  import Ecto.Query

  alias Orders.Repo
  alias Orders.Models.Product

  def get_products() do
    Repo.all(Product)
  end

  def get_products(ids) when is_list(ids) do
    query = from(p in Product, where: p.id in ^ids)
    Repo.all(query)
  end

  def get_product(%{id: id}) do
    Repo.get(Product, id)
  end

  def create_product(params) do
    Product.changeset(%Product{}, params)
    |> Repo.insert()
  end
end
