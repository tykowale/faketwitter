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
    conn = build_conn
    post = insert(:post)

    conn = get(conn, post_path(conn, :show, post))

    assert json_response(conn, 200) == render_json(PostView, "show.json", post: post)
  end
end
