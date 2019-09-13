defmodule Orders.Resolvers.Payments do
  import Ecto.Query

  alias Orders.Repo
  alias Orders.Models.Payment
  alias Orders.Resolvers.Orders

  def get_all_payments() do
    Repo.all(Payment)
  end

  def get_payment_by_id(%{id: id}) do
    Repo.get(Payment, id)
  end

  def get_payments_by_order(order_id) do
    query = from(p in Payment, where: p.order_id == ^order_id, order_by: [desc: p.inserted_at])

    Repo.all(query)
  end

  def create_payment(%{order_id: order_id, amount: amount} = params) do
    with {:ok, _} <- check_idempotence(order_id, amount),
         {:ok, _} <- Orders.update_balance(order_id, amount) do
      %Payment{}
      |> Payment.changeset(params)
      |> Repo.insert()
    end
  end

  defp check_idempotence(order_id, amount) do
    case get_payments_by_order(order_id) do
      [last_payment | _tail] ->
        if(is_duplicate(last_payment, amount)) do
          {:error, "Payment already processed please try again in 5 minutes"}
        else
          {:ok, "new payment"}
        end

      [] ->
        {:ok, "no payments"}

      _ ->
        {:error, "error getting payemnts"}
    end
  end

  defp is_duplicate(last_payment, amount) do
    is_within_five_mins(last_payment.inserted_at) && amount == last_payment.amount
  end

  defp is_within_five_mins(last_payment_time) do
    five_mins_ago = NaiveDateTime.add(NaiveDateTime.utc_now(), -300, :seconds)
    last_payment_time < five_mins_ago
  end
end
