defmodule QuestoexWeb.PageLive do
  use QuestoexWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.questao_card />
      <div class="mt-16">
        <div class="flex flex-row gap-4">
          <.button>Voltar</.button>
          <.button>Avançar</.button>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def questao_card(assigns) do
    ~H"""
    <div>
      <div class="flex flex-row gap-4">
        <div>Prova: Fuvest 2023</div>
        <div>Banca: Fuvest 2023</div>
      </div>
      <div class="mt-6 space-y-6">
        lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      </div>
      <div>
        <ul class="list-disc list-inside mt-4 space-y-2">
          <li>Opção A</li>
          <li>Opção B</li>
          <li>Opção C</li>
          <li>Opção D</li>
          <li>Opção E</li>
        </ul>
      </div>
    </div>
    """
  end
end
