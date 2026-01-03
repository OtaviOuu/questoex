defmodule QuestoexWeb.IngestaoLive.New do
  use QuestoexWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <h1>Nova Ingestão de Provas</h1>
    </Layouts.app>
    """
  end
end
