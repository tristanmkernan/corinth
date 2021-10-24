defmodule Corinth.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Corinth.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{

      })
      |> Corinth.Posts.create_post()

    post
  end
end
