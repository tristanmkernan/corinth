defmodule CorinthWeb.PostLive.DeleteComponent do
  use CorinthWeb, :live_component

  alias Corinth.Posts

  @impl true
  def mount(socket) do
    assigns = []

    {:ok, assign(socket, assigns)}
  end

  @impl true
  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)

    {:ok, socket}
  end

  @impl true
  def handle_event("delete", _params, socket) do
    Posts.delete_post(socket.assigns.post)

    {:noreply,
     socket
     |> put_flash(:info, "Post deleted")
     |> push_redirect(to: socket.assigns.return_to)}
  end
end
