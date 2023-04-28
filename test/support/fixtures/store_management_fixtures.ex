defmodule StoreManagementSystem.StoreManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StoreManagementSystem.StoreManagement` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        location: "some location",
        product_information: "some product_information",
        store_id: 42
      })
      |> StoreManagementSystem.StoreManagement.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        current_inventory_count: 42,
        name: "some name",
        retail_price: 120.5,
        vendor: "some vendor",
        wholesale_price: 120.5
      })
      |> StoreManagementSystem.StoreManagement.create_product()

    product
  end
end
