defmodule Microblog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Post


  schema "posts" do
    field :favs, :integer
    field :message, :string
    field :userId, :integer

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:userId, :message, :favs])
    |> validate_required([:userId, :message, :favs])
  end
end
