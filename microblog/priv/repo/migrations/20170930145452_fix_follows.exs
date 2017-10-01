defmodule Microblog.Repo.Migrations.FixFollows do
  use Ecto.Migration

  def change do
   alter table("follows") do
     remove :folowee_id
     add :followee_id, references(:users, on_delete: :delete_all)
   end
  end
end
