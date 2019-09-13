defmodule Orders.Repo.Migrations.CreateOrderProducts do
  use Ecto.Migration

  def change do
    create table(:order_products, primary_key: false) do
      add(:order_id, references(:orders, type: :uuid))
      add(:product_id, references(:products, type: :uuid))
    end
  end
end
