defmodule Orders.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:amount, :integer)
      add(:note, :string)
      add(:order_id, references(:orders, type: :uuid))

      timestamps()
    end
  end
end
