defmodule Orders.Controllers.Payments do
  alias Orders.Resolvers.Payments

  def index(_args, _info) do
    {:ok, Payments.get_all_payments()}
  end

  def create(args, _info) do
    Payments.create_payment(args)
  end
end
