defmodule Backend.Post do
  use Backend.Web, :model

  schema "posts" do
    field :message

    timestamps
  end

  @required_fields ~w(message)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, [])
  end
end
