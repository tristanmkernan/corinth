defmodule Corinth.Repo.Migrations.UpdateTextAttachmentContent do
  use Ecto.Migration

  def change do
    alter table(:text_attachments) do
      modify :content, :text, from: :string
    end
  end
end
