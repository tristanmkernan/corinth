defmodule Corinth.Repo.Migrations.CreateFileAttachments do
  use Ecto.Migration

  def change do
    create table(:file_attachments) do
      add :location, :string
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

    create index(:file_attachments, [:post_id])
  end
end
