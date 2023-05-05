defmodule StoreManagementSystem.Repo.Migrations.AddStoreIdToProduct do
  use Ecto.Migration

  def change do
    alter table("product") do
      add :store_id, :integer
    end
  end
end
