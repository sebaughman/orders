defmodule Orders.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:total, :integer)
      add(:balance, :integer)
      add(:description, :string)

      timestamps()
    end
  end
end
