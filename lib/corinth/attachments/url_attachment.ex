defmodule Corinth.Attachments.UrlAttachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "url_attachments" do
    field :url, :string
    belongs_to :post, Corinth.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(url_attachment, attrs) do
    url_attachment
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
