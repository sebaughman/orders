defmodule Orders.Resolvers.Orders do
  import Ecto.Changeset

  alias Orders.Repo
  alias Orders.Models.Order
  alias Orders.Resolvers.Products

  def get_all_orders() do
    Repo.all(Order)
  end

  def get_order_by_id(%{id: id}) do
    Repo.get(Order, id)
  end

  def update_balance(order_id, amount) do
    order = get_order_by_id(%{id: order_id})

    with {:ok, updated_balance} <- get_updated_balance(order, amount) do
      order
      |> Ecto.Changeset.change(balance: updated_balance)
      |> Repo.update()
    end
  end

  defp get_updated_balance(%{balance: balance} = _order, amount) do
    cond do
      balance == 0 ->
        {:error, "order paid off"}

      balance - amount < 0 ->
        {:error, "payment too large"}

      true ->
        {:ok, balance - amount}
    end
  end

  def create_order(product_ids) when is_list(product_ids) do
    products = Products.get_products(product_ids)
    order_params = get_order_params(products)

    %Order{}
    |> Repo.preload(:products)
    |> Order.changeset(order_params)
    |> put_assoc(:products, products)
    |> Repo.insert!()
  end

  def create_order(product_id), do: create_order([product_id])
  def create_order(nil), do: {:error, "must supply at least one product id"}

  defp get_order_params(products) when is_list(products) do
    params =
      Enum.reduce(products, %{total: 0, description: "Order containing: "}, fn product, acc ->
        %{
          total: acc.total + product.price,
          description: acc.description <> product.name <> ", "
        }
      end)

    Map.merge(params, %{balance: params.total})
  end

  defp get_order_params(product), do: get_order_params([product])
end
