defmodule CorinthWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `CorinthWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal CorinthWeb.PostLive.FormComponent,
        id: @post.id || :new,
        action: @live_action,
        post: @post,
        return_to: Routes.post_index_path(@socket, :index) %>
  """
  def live_modal(component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    title = Keyword.fetch!(opts, :title)
    current_user = Keyword.fetch!(opts, :current_user)

    modal_opts = [
      id: :modal,
      return_to: path,
      component: component,
      title: title,
      current_user: current_user,
      opts: opts
    ]

    live_component(CorinthWeb.ModalComponent, modal_opts)
  end
end
