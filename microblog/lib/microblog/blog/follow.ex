defmodule Microblog.Blog.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Follow


  schema "follows" do
    belongs_to :follower, Microblog.Accounts.User
    belongs_to :followee, Microblog.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:follower_id, :followee_id])
    |> validate_required([:follower_id, :followee_id])
  end
end
