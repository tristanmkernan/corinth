defmodule CorinthWeb.PostLive.Index do
  use CorinthWeb, :live_view

  on_mount CorinthWeb.UserLiveAuth

  alias Corinth.Posts
  alias Corinth.Posts.Post

  @impl true
  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user

    assigns = [
      posts: list_posts(current_user)
    ]

    IO.inspect(assigns)

    {:ok, assign(socket, assigns)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Posts.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Posts")
    |> assign(:post, nil)
  end

  defp apply_action(socket, _, _), do: socket

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Posts.get_post!(id)
    {:ok, _} = Posts.delete_post(post)

    {:noreply, assign(socket, :posts, list_posts(socket.current_user))}
  end

  defp list_posts(current_user) do
    Posts.list_posts_for_user(current_user.id)
  end
end
