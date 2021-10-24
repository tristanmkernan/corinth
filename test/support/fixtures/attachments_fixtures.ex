defmodule Corinth.AttachmentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Corinth.Attachments` context.
  """

  @doc """
  Generate a text_attachment.
  """
  def text_attachment_fixture(attrs \\ %{}) do
    {:ok, text_attachment} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Corinth.Attachments.create_text_attachment()

    text_attachment
  end

  @doc """
  Generate a url_attachment.
  """
  def url_attachment_fixture(attrs \\ %{}) do
    {:ok, url_attachment} =
      attrs
      |> Enum.into(%{
        url: "some url"
      })
      |> Corinth.Attachments.create_url_attachment()

    url_attachment
  end

  @doc """
  Generate a file_attachment.
  """
  def file_attachment_fixture(attrs \\ %{}) do
    {:ok, file_attachment} =
      attrs
      |> Enum.into(%{
        location: "some location"
      })
      |> Corinth.Attachments.create_file_attachment()

    file_attachment
  end
end
