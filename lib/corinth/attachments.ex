defmodule Corinth.Attachments do
  @moduledoc """
  The Attachments context.
  """

  import Ecto.Query, warn: false
  alias Corinth.Repo

  alias Corinth.Attachments.TextAttachment

  @doc """
  Returns the list of text_attachments.

  ## Examples

      iex> list_text_attachments()
      [%TextAttachment{}, ...]

  """
  def list_text_attachments do
    Repo.all(TextAttachment)
  end

  @doc """
  Gets a single text_attachment.

  Raises `Ecto.NoResultsError` if the Text attachment does not exist.

  ## Examples

      iex> get_text_attachment!(123)
      %TextAttachment{}

      iex> get_text_attachment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_text_attachment!(id), do: Repo.get!(TextAttachment, id)

  @doc """
  Creates a text_attachment.

  ## Examples

      iex> create_text_attachment(%{field: value})
      {:ok, %TextAttachment{}}

      iex> create_text_attachment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_text_attachment(attrs \\ %{}) do
    %TextAttachment{}
    |> TextAttachment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a text_attachment.

  ## Examples

      iex> update_text_attachment(text_attachment, %{field: new_value})
      {:ok, %TextAttachment{}}

      iex> update_text_attachment(text_attachment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_text_attachment(%TextAttachment{} = text_attachment, attrs) do
    text_attachment
    |> TextAttachment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a text_attachment.

  ## Examples

      iex> delete_text_attachment(text_attachment)
      {:ok, %TextAttachment{}}

      iex> delete_text_attachment(text_attachment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_text_attachment(%TextAttachment{} = text_attachment) do
    Repo.delete(text_attachment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking text_attachment changes.

  ## Examples

      iex> change_text_attachment(text_attachment)
      %Ecto.Changeset{data: %TextAttachment{}}

  """
  def change_text_attachment(%TextAttachment{} = text_attachment, attrs \\ %{}) do
    TextAttachment.changeset(text_attachment, attrs)
  end

  alias Corinth.Attachments.UrlAttachment

  @doc """
  Returns the list of url_attachments.

  ## Examples

      iex> list_url_attachments()
      [%UrlAttachment{}, ...]

  """
  def list_url_attachments do
    Repo.all(UrlAttachment)
  end

  @doc """
  Gets a single url_attachment.

  Raises `Ecto.NoResultsError` if the Url attachment does not exist.

  ## Examples

      iex> get_url_attachment!(123)
      %UrlAttachment{}

      iex> get_url_attachment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_url_attachment!(id), do: Repo.get!(UrlAttachment, id)

  @doc """
  Creates a url_attachment.

  ## Examples

      iex> create_url_attachment(%{field: value})
      {:ok, %UrlAttachment{}}

      iex> create_url_attachment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_url_attachment(attrs \\ %{}) do
    %UrlAttachment{}
    |> UrlAttachment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a url_attachment.

  ## Examples

      iex> update_url_attachment(url_attachment, %{field: new_value})
      {:ok, %UrlAttachment{}}

      iex> update_url_attachment(url_attachment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_url_attachment(%UrlAttachment{} = url_attachment, attrs) do
    url_attachment
    |> UrlAttachment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a url_attachment.

  ## Examples

      iex> delete_url_attachment(url_attachment)
      {:ok, %UrlAttachment{}}

      iex> delete_url_attachment(url_attachment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_url_attachment(%UrlAttachment{} = url_attachment) do
    Repo.delete(url_attachment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking url_attachment changes.

  ## Examples

      iex> change_url_attachment(url_attachment)
      %Ecto.Changeset{data: %UrlAttachment{}}

  """
  def change_url_attachment(%UrlAttachment{} = url_attachment, attrs \\ %{}) do
    UrlAttachment.changeset(url_attachment, attrs)
  end

  alias Corinth.Attachments.FileAttachment

  @doc """
  Returns the list of file_attachments.

  ## Examples

      iex> list_file_attachments()
      [%FileAttachment{}, ...]

  """
  def list_file_attachments do
    Repo.all(FileAttachment)
  end

  @doc """
  Gets a single file_attachment.

  Raises `Ecto.NoResultsError` if the File attachment does not exist.

  ## Examples

      iex> get_file_attachment!(123)
      %FileAttachment{}

      iex> get_file_attachment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_file_attachment!(id), do: Repo.get!(FileAttachment, id)

  @doc """
  Creates a file_attachment.

  ## Examples

      iex> create_file_attachment(%{field: value})
      {:ok, %FileAttachment{}}

      iex> create_file_attachment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_file_attachment(attrs \\ %{}) do
    %FileAttachment{}
    |> FileAttachment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a file_attachment.

  ## Examples

      iex> update_file_attachment(file_attachment, %{field: new_value})
      {:ok, %FileAttachment{}}

      iex> update_file_attachment(file_attachment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_file_attachment(%FileAttachment{} = file_attachment, attrs) do
    file_attachment
    |> FileAttachment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a file_attachment.

  ## Examples

      iex> delete_file_attachment(file_attachment)
      {:ok, %FileAttachment{}}

      iex> delete_file_attachment(file_attachment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_file_attachment(%FileAttachment{} = file_attachment) do
    Repo.delete(file_attachment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking file_attachment changes.

  ## Examples

      iex> change_file_attachment(file_attachment)
      %Ecto.Changeset{data: %FileAttachment{}}

  """
  def change_file_attachment(%FileAttachment{} = file_attachment, attrs \\ %{}) do
    FileAttachment.changeset(file_attachment, attrs)
  end
end
