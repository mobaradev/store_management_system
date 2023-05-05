defmodule StoreManagementSystemWeb.StoreLive.Show do
  use StoreManagementSystemWeb, :live_view

  alias StoreManagementSystem.StoreManagement

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:store, StoreManagement.get_store!(id))
     |> assign(:products, List.first(StoreManagement.list_products_by_store_id!(id)))}
  end

  defp page_title(:show), do: "Show Store"
  defp page_title(:edit), do: "Edit Store"
end
