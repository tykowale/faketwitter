defmodule Backend.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :message, :string

      timestamps
    end
  end
end
