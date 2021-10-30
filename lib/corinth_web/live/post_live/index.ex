defmodule CorinthWeb.PostLive.Index do
  use CorinthWeb, :live_view

  on_mount CorinthWeb.UserLiveAuth

  alias Corinth.Posts
  alias Corinth.Posts.Post

  @impl true
  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user

    Posts.subscribe(current_user.id)

    assigns = [
      posts: list_posts(current_user)
    ]

    {:ok, assign(socket, assigns)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_info({:post_created, _post}, socket) do
    {:noreply, assign(socket, posts: list_posts(socket.assigns.current_user))}
  end

  @impl true
  def handle_info({:post_updated, _post}, socket) do
    {:noreply, assign(socket, posts: list_posts(socket.assigns.current_user))}
  end

  @impl true
  def handle_info({:post_deleted, _post}, socket) do
    {:noreply, assign(socket, posts: list_posts(socket.assigns.current_user))}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    user_id = socket.assigns.current_user.id

    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Posts.get_post_for_user!(user_id, id))
  end

  defp apply_action(socket, :delete, %{"id" => id}) do
    user_id = socket.assigns.current_user.id

    socket
    |> assign(:page_title, "Delete Post")
    |> assign(:post, Posts.get_post_for_user!(user_id, id))
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

  defp list_posts(current_user) do
    Posts.list_posts_for_user(current_user.id)
  end
end
