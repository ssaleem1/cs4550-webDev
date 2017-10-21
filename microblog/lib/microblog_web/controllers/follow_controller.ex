defmodule MicroblogWeb.FollowController do
  use MicroblogWeb, :controller

  alias Microblog.Blog
  alias Microblog.Blog.Follow
  alias Microblog.Accounts

  def create(conn, %{"follow" => follow_params}) do
    case Blog.create_follow(follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "You are now following this user!")
        |> redirect(to: user_path(conn, :show, Accounts.get_user!(follow.followee_id)))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    follow = Blog.get_follow!(id)
    {:ok, _follow} = Blog.delete_follow(follow)

    conn
    |> put_flash(:info, "Follow deleted successfully.")
    |> redirect(to: follow_path(conn, :index))
  end
end
