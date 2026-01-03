defmodule QuestoexWeb.QuestoesLive.New do
  use QuestoexWeb, :live_view
  use CKEditor5

  def mount(_params, _session, socket) do
    {:ok, assign(socket, enunciado: "<p>questao</p>")}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.ckeditor id="editor" type="classic" value={@enunciado} />
    </Layouts.app>
    """
  end
end
