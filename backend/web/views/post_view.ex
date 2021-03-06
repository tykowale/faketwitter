defmodule Backend.PostView do
  use Backend.Web, :view

  def render("index.json", %{posts: posts}) do
    %{
      posts: Enum.map(posts, &post_json/1)
    }
  end

  def render("show.json", %{post: post}) do
    %{
      post: post_json(post)
    }
  end

  def post_json(post) do
    %{
      id: post.id,
      message: post.message,
      inserted_at: post.inserted_at
    }
  end
end
