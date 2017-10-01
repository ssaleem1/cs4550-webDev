defmodule Microblog.Repo.Migrations.AddUserToPost do
  use Ecto.Migration

  def change do
    alter table("posts") do
      remove :userId
      add :user_id, references(:users, on_delete: :delete_all)
    end

    create index(:posts, [:user_id])
  end
end
