defmodule Corinth.Repo.Migrations.UpdateUrlAttachmentLocation do
  use Ecto.Migration

  def change do
    alter table(:url_attachments) do
      modify :url, :text, from: :string
    end
  end
end
