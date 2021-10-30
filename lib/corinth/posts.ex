defmodule Corinth.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Phoenix.PubSub
  alias Corinth.Repo

  alias Corinth.Posts.Post

  defp topic(user_id) do
    "user:" <> Integer.to_string(user_id)
  end

  def subscribe(user_id) do
    PubSub.subscribe(Corinth.PubSub, topic(user_id))
  end

  def publish(message, user_id) do
    PubSub.broadcast(Corinth.PubSub, topic(user_id), message)
  end

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Repo.all(Post)
  end

  def list_posts_for_user(user_id) do
    query =
      from p in Post,
        where: p.user_id == ^user_id,
        order_by: [desc: :inserted_at]

    Repo.all(query)
    |> Repo.preload(:text_attachments)
    |> Repo.preload(:url_attachments)
    |> Repo.preload(:file_attachments)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post_for_user!(user_id, id) do
    query =
      from p in Post,
        where: p.user_id == ^user_id,
        order_by: [desc: :inserted_at]

    Repo.get!(query, id)
    |> Repo.preload(:text_attachments)
    |> Repo.preload(:url_attachments)
    |> Repo.preload(:file_attachments)
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    create_result =
      %Post{}
      |> Post.changeset(attrs)
      |> Repo.insert()

    case create_result do
      {:ok, %Post{} = post} ->
        publish({:post_created, post}, post.user_id)
        {:ok, post}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    update_result =
      post
      |> Post.changeset(attrs)
      |> Repo.update()

    case update_result do
      {:ok, %Post{} = post} ->
        publish({:post_updated, post}, post.user_id)
        {:ok, post}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    delete_result = Repo.delete(post)

    case delete_result do
      {:ok, %Post{} = post} ->
        publish({:post_deleted, post}, post.user_id)
        {:ok, post}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
