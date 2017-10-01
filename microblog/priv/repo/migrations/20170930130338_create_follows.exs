defmodule Microblog.Repo.Migrations.CreateFollows do
  use Ecto.Migration

  def change do
    create table(:follows) do
      add :follower_id, references(:users, on_delete: :delete_all)
      add :folowee_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:follows, [:follower_id])
    create index(:follows, [:folowee_id])
  end
end
