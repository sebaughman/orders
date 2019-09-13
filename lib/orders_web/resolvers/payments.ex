defmodule Orders.Resolvers.Payments do
  alias Orders.Repo
  alias Orders.Models.Payment
  alias Orders.Resolvers.Orders

  def get_all_payments() do
    Repo.all(Payment)
  end

  def get_payment_by_id(%{id: id}) do
    Repo.get(Payment, id)
  end

  def create_payment(%{order_id: order_id, amount: amount} = params) do
    with {:ok, _} <- Orders.update_balance(order_id, amount) do
      %Payment{}
      |> Payment.changeset(params)
      |> Repo.insert()
    end
  end
end
