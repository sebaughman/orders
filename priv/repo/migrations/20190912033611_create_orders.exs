defmodule Orders.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :total, :integer
      add :balance, :integer
      add :description, :string

      timestamps()
    end
  end
end
