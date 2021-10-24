defmodule Corinth.Repo.Migrations.UpdatePostsTable do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :title, :string
    end
  end
end
