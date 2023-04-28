defmodule StoreManagementSystem.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:product) do
      add :name, :string
      add :vendor, :string
      add :wholesale_price, :float
      add :retail_price, :float
      add :current_inventory_count, :integer

      timestamps()
    end
  end
end
