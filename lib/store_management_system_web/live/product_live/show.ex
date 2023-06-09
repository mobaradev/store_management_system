defmodule StoreManagementSystemWeb.ProductLive.Show do
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
     |> assign(:product, StoreManagement.get_product!(id))
     |> assign(:stores, StoreManagement.list_stores())
    }
  end

  defp page_title(:show), do: "Show Product"
  defp page_title(:edit), do: "Edit Product"
end
