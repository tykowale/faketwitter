defmodule Backend.PostControllerTest do
  use Backend.ConnCase

  alias Backend.PostView

  test "#index returns a list of posts" do
    conn = build_conn()
    post = insert(:post)

    conn = get(conn, post_path(conn, :index))

    assert json_response(conn, 200) == render_json(PostView, "index.json", posts: [post])
  end

  test "#show returns a single post" do
    conn = build_conn()
    post = insert(:post)

    conn = get(conn, post_path(conn, :show, post))

    assert json_response(conn, 200) == render_json(PostView, "show.json", post: post)
  end

  test "#create returns post on successful create" do
    conn = build_conn()
    post = %{message: "sample message"}

    conn = post(conn, post_path(conn, :create, post: post))
    post = Poison.decode!(conn.resp_body, keys: :atoms!)

    assert json_response(conn, 201) == render_json(PostView, "show.json", post)
  end

  test "#create returns an error message on unseuccessful create" do
    conn = build_conn()
    post = %{message: ""}

    conn = post(conn, post_path(conn, :create), post: post)

    assert response(conn, 400) == "There was an error creating your post"
  end
end
