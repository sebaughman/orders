defmodule Orders.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :amount, :integer
      add :note, :string
      add :order_id, references(:orders)

      timestamps()
    end
  end
end
