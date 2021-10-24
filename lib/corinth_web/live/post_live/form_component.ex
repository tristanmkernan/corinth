defmodule CorinthWeb.PostLive.FormComponent do
  use CorinthWeb, :live_component

  alias Corinth.Posts

  @impl true
  def mount(socket) do
    assigns = [
      current_tab: :text
    ]

    {:ok, assign(socket, assigns)}
  end

  @impl true
  def update(%{post: post} = assigns, socket) do
    changeset = Posts.change_post(post)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("change_tab", %{"tab" => tab}, socket) do
    {:noreply, assign(socket, current_tab: tab)}
  end

  @impl true
  def handle_event("change_tab", params, socket) do
    IO.inspect(params)
    {:noreply, socket}
  end

  @impl true
  def handle_event("validate", %{"post" => post_params}, socket) do
    changeset =
      socket.assigns.post
      |> Posts.change_post(post_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"post" => post_params}, socket) do
    save_post(socket, socket.assigns.action, post_params)
  end

  defp save_post(socket, :edit, post_params) do
    case Posts.update_post(socket.assigns.post, post_params) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_post(socket, :new, post_params) do
    case Posts.create_post(post_params) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def tab_header(assigns) do
    class =
      if assigns.is_active do
        "is-active"
      else
        ""
      end

    assigns = assign(assigns, class: class)

    ~H"""
    <li class={@class}>
      <a phx-click="change_tab" phx-value-tab={:files} phx-target={@myself}>
        <span class="icon is-small"><i class={@icon} aria-hidden="true"></i></span>
        <span><%= @title %></span>
      </a>
    </li>
    """
  end
end
