defmodule Corinth.Attachments.FileAttachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "file_attachments" do
    field :name, :string
    field :location, :string
    belongs_to :post, Corinth.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(file_attachment, attrs) do
    file_attachment
    |> cast(attrs, [:location, :name])
    |> validate_required([:location, :name])
  end
end
