defmodule Corinth.Attachments.TextAttachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "text_attachments" do
    field :content, :string

    belongs_to :post, Corinth.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(text_attachment, attrs) do
    text_attachment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
