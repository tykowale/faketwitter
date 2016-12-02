defmodule Backend.Factory do
  use ExMachina.Ecto, repo: Backend.Repo

  def post_factory do
    %Backend.Post {
      message: "Sample Message"
    }
  end
end
