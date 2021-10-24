defmodule Corinth.Repo.Migrations.CreateUrlAttachments do
  use Ecto.Migration

  def change do
    create table(:url_attachments) do
      add :url, :string
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

    create index(:url_attachments, [:post_id])
  end
end
