defmodule StoreManagementSystem.StoreManagement.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :location, :string
    field :product_information, :string
    field :store_id, :integer
    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :store_id, :product_information])
    |> validate_required([:location, :store_id, :product_information])
  end
end
