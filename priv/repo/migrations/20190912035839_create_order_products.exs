defmodule Orders.Repo.Migrations.CreateOrderProducts do
  use Ecto.Migration

  def change do
    create table(:order_products, primary_key: false) do
      add :order_id, references(:orders, on_delete: :delete_all)
      add :product_id, references(:products, on_delete: :delete_all)
    end
  end
end
