defmodule Backend.PostController do
  use Backend.Web, :controller

  alias Backend.Post

  def index(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index.json", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.json", post: post)
  end

  def create(conn, %{"post" => post}) do
    changeset = Post.changeset(%Post{}, post)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_status(:created)
        |> render("show.json", post: post)
      _ ->
        conn
        # |> put_status(:unprocessable_entity)
        |> send_resp(400, "There was an error creating your post")
    end
  end
end
