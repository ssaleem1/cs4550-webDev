defmodule Microblog.Repo.Migrations.UniqueFollows do
  use Ecto.Migration

  def change do
   create unique_index(:follows, [:follower_id, :followee_id])
  end
end
