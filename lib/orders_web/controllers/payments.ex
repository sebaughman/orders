defmodule Orders.Controllers.Payments do
  alias Orders.Resolvers.Payments

  def all(_args, _info) do
    {:ok, Payments.get_all_payments()}
  end

  def make_payment(args, _info) do
    Payments.create_payment(args)
  end
end
