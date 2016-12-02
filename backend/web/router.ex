defmodule Backend.Router do
  use Backend.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Backend do
    pipe_through :api

    resources "/posts", PostController, only: [:index, :show, :create]
  end
end
