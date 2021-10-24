defmodule Corinth.Attachments.FileAttachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "file_attachments" do
    field :name, :string
    field :location, :string
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(file_attachment, attrs) do
    file_attachment
    |> cast(attrs, [:location, :name, :post_id])
    |> validate_required([:location, :name, :post_id])
  end
end
