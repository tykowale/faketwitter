defmodule Backend.Post do
  use Backend.Web, :model

  schema "posts" do
    field :message

    timestamps
  end
end
