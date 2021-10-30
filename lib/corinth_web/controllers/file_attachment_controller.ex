defmodule CorinthWeb.FileAttachmentController do
  use CorinthWeb, :controller

  alias Corinth.Attachments

  def show(conn, %{"id" => id}) do
    file_attachment = Attachments.get_file_attachment!(id)

    if conn.assigns.current_user.id != file_attachment.post.user_id do
      send_resp(conn, 403, "Forbidden")
    else
      location = Path.join([:code.priv_dir(:corinth), "static", file_attachment.location])
      send_download(conn, {:file, location}, filename: file_attachment.name)
    end
  end
end
