defmodule CorinthWeb.PostLive.FormComponent do
  use CorinthWeb, :live_component

  alias Corinth.Posts
  alias Corinth.Attachments.{TextAttachment, UrlAttachment}

  @max_files 10

  @impl true
  def mount(socket) do
    assigns = []

    {:ok, assign(socket, assigns)}
  end

  @impl true
  def update(%{post: post} = assigns, socket) do
    changeset = Posts.change_post(post)

    socket =
      socket
      |> assign(assigns)
      |> assign(:changeset, changeset)
      |> allow_upload(:files, accept: :any, max_entries: @max_files, auto_upload: :t)

    {:ok, socket}
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

  def handle_event("add_text", _params, socket) do
    changeset =
      EctoNestedChangeset.append_at(
        socket.assigns.changeset,
        :text_attachments,
        %TextAttachment{}
      )

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("add_url", _params, socket) do
    changeset =
      EctoNestedChangeset.append_at(
        socket.assigns.changeset,
        :url_attachments,
        %UrlAttachment{}
      )

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :files, ref)}
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
    post_params = Map.put(post_params, "user_id", socket.assigns.current_user.id)

    uploaded_files =
      consume_uploaded_entries(socket, :files, fn %{path: path}, entry ->
        dest = Path.join([:code.priv_dir(:corinth), "static", "uploads", Path.basename(path)])
        File.cp!(path, dest)
        {entry.client_name, Routes.static_path(socket, "/uploads/#{Path.basename(dest)}")}
      end)

    post_params =
      Map.put(
        post_params,
        "file_attachments",
        Enum.map(uploaded_files, fn {name, location} -> %{location: location, name: name} end)
      )

    case Posts.create_post(post_params) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:too_many_files), do: "You have selected too many files"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"

  defp change_tab(to) do
    JS.remove_class("is-active", to: ".tabs--header")
    |> JS.add_class("is-active", to: "#tabs--header--" <> to)
    |> JS.add_class("is-hidden", to: ".tabs--content")
    |> JS.remove_class("is-hidden", to: "#tabs--content--" <> to)
  end
end
