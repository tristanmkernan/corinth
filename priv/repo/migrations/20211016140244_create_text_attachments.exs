defmodule Corinth.Repo.Migrations.CreateTextAttachments do
  use Ecto.Migration

  def change do
    create table(:text_attachments) do
      add :content, :string
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

    create index(:text_attachments, [:post_id])
  end
end
