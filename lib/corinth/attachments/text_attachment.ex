defmodule Corinth.Attachments.TextAttachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "text_attachments" do
    field :content, :string
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(text_attachment, attrs) do
    text_attachment
    |> cast(attrs, [:content, :post_id])
    |> validate_required([:content, :post_id])
  end
end
