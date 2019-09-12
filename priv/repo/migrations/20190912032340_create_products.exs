defmodule Orders.Repo.Migrations.CreateProducts do
  use Ecto.Migration
  def change do
    create table(:products) do
      add :name, :string
      add :price, :integer
      add :description, :string

      timestamps()
    end
  end
end
