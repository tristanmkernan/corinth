defmodule Corinth.Repo.Migrations.AddFileAttachmentName do
  use Ecto.Migration

  def change do
    alter table(:file_attachments) do
      add :name, :text
    end
  end
end
