defmodule StoreManagementSystemWeb.ProductLive.Index do
  use StoreManagementSystemWeb, :live_view

  alias StoreManagementSystem.StoreManagement
  alias StoreManagementSystem.StoreManagement.Product

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :product_collection, StoreManagement.list_product())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Product")
    |> assign(:product, StoreManagement.get_product!(id))
    |> assign(:stores, StoreManagement.list_stores())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
    |> assign(:stores, StoreManagement.list_stores())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Product")
    |> assign(:product, nil)
  end

  @impl true
  def handle_info({StoreManagementSystemWeb.ProductLive.FormComponent, {:saved, product}}, socket) do
    {:noreply, stream_insert(socket, :product_collection, product)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    product = StoreManagement.get_product!(id)
    {:ok, _} = StoreManagement.delete_product(product)

    {:noreply, stream_delete(socket, :product_collection, product)}
  end
end
