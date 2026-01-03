defmodule QuestoexWeb.IngestaoLive.Index do
  use QuestoexWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.prova_files_list />
    </Layouts.app>
    """
  end

  def prova_files_list(assigns) do
    ~H"""
    <div class="flex flex-col gap-4">
      <ul>
        <li :for={_ <- 1..100}>Prova pdf</li>
      </ul>
    </div>
    """
  end
end
