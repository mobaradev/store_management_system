defmodule StoreManagementSystem.StoreManagement.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product" do
    field :current_inventory_count, :integer
    field :name, :string
    field :retail_price, :float
    field :vendor, :string
    field :wholesale_price, :float
    belongs_to :store, StoreManagementSystem.StoreManagement.Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor, :wholesale_price, :retail_price, :current_inventory_count, :store_id])
    |> validate_required([:name, :vendor, :wholesale_price, :retail_price, :current_inventory_count, :store_id])
  end
end
