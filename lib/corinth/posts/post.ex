defmodule Corinth.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :user_id, :id
    field :title, :string

    has_many :text_attachments, Corinth.Attachments.TextAttachment
    has_many :file_attachments, Corinth.Attachments.FileAttachment
    has_many :url_attachments, Corinth.Attachments.UrlAttachment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user_id, :title])
    |> validate_required([:user_id, :title])
    |> cast_assoc(:text_attachments)
    |> cast_assoc(:url_attachments)
    |> cast_assoc(:file_attachments)
  end
end
