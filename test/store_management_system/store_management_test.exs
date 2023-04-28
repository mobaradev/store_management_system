defmodule StoreManagementSystem.StoreManagementTest do
  use StoreManagementSystem.DataCase

  alias StoreManagementSystem.StoreManagement

  describe "stores" do
    alias StoreManagementSystem.StoreManagement.Store

    import StoreManagementSystem.StoreManagementFixtures

    @invalid_attrs %{location: nil, product_information: nil, store_id: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert StoreManagement.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert StoreManagement.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{location: "some location", product_information: "some product_information", store_id: 42}

      assert {:ok, %Store{} = store} = StoreManagement.create_store(valid_attrs)
      assert store.location == "some location"
      assert store.product_information == "some product_information"
      assert store.store_id == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreManagement.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{location: "some updated location", product_information: "some updated product_information", store_id: 43}

      assert {:ok, %Store{} = store} = StoreManagement.update_store(store, update_attrs)
      assert store.location == "some updated location"
      assert store.product_information == "some updated product_information"
      assert store.store_id == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreManagement.update_store(store, @invalid_attrs)
      assert store == StoreManagement.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = StoreManagement.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> StoreManagement.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = StoreManagement.change_store(store)
    end
  end

  describe "product" do
    alias StoreManagementSystem.StoreManagement.Product

    import StoreManagementSystem.StoreManagementFixtures

    @invalid_attrs %{current_inventory_count: nil, name: nil, retail_price: nil, vendor: nil, wholesale_price: nil}

    test "list_product/0 returns all product" do
      product = product_fixture()
      assert StoreManagement.list_product() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert StoreManagement.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{current_inventory_count: 42, name: "some name", retail_price: 120.5, vendor: "some vendor", wholesale_price: 120.5}

      assert {:ok, %Product{} = product} = StoreManagement.create_product(valid_attrs)
      assert product.current_inventory_count == 42
      assert product.name == "some name"
      assert product.retail_price == 120.5
      assert product.vendor == "some vendor"
      assert product.wholesale_price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreManagement.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{current_inventory_count: 43, name: "some updated name", retail_price: 456.7, vendor: "some updated vendor", wholesale_price: 456.7}

      assert {:ok, %Product{} = product} = StoreManagement.update_product(product, update_attrs)
      assert product.current_inventory_count == 43
      assert product.name == "some updated name"
      assert product.retail_price == 456.7
      assert product.vendor == "some updated vendor"
      assert product.wholesale_price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreManagement.update_product(product, @invalid_attrs)
      assert product == StoreManagement.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = StoreManagement.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> StoreManagement.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = StoreManagement.change_product(product)
    end
  end
end
