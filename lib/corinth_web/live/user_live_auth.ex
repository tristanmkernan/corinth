defmodule CorinthWeb.UserLiveAuth do
  import Phoenix.LiveView

  alias Corinth.Accounts

  def on_mount(:default, _params, %{"user_token" => user_token} = _session, socket) do
    user = Accounts.get_user_by_session_token(user_token)

    socket = assign_new(socket, :current_user, fn -> user end)

    if socket.assigns.current_user.confirmed_at do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/login")}
    end
  end

  def on_mount(:default, _params, _session, socket) do
    {:cont, socket}
  end
end
