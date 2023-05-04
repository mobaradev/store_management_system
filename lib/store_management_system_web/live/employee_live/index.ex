defmodule StoreManagementSystemWeb.EmployeeLive.Index do
  use StoreManagementSystemWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, StoreManagementSystem.HumanResources.list_employees())}
  end
end
