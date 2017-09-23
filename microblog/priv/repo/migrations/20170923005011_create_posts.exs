defmodule Microblog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :userId, :integer
      add :message, :text
      add :favs, :integer

      timestamps()
    end

  end
end
