defmodule Corinth.Attachments.UrlAttachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "url_attachments" do
    field :url, :string
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(url_attachment, attrs) do
    url_attachment
    |> cast(attrs, [:url, :post_id])
    |> validate_required([:url, :post_id])
  end
end
