defmodule QuestoexWeb.PageLive do
  use QuestoexWeb, :live_view

  alias Questoex.Questoes

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :questoes, [])}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.search_section />

      <.questao_card :for={questao <- @questoes} questao={questao} />

      <div class="flex justify-center mt-8 join">
        <button class="join-item btn">1</button>
        <button class="join-item btn btn-active">2</button>
        <button class="join-item btn">3</button>
        <button class="join-item btn">4</button>
        <button class="join-item btn">5</button>
      </div>
    </Layouts.app>
    """
  end

  def search_section(assigns) do
    ~H"""
    <div class="flex flex-row gap-4 mb-18">
      <form phx-submit="search">
        <div class="flex flex-row gap-2 mb-4">
          <.input type="text" value="" name="query" placeholder="Buscar questão..." />
          <.input type="text" value="" name="query" placeholder="Buscar questão..." />
          <.input type="text" value="" name="query" placeholder="Buscar questão..." />
          <.input
            type="select"
            value=""
            name="category"
            options={["Categoria 1", "Categoria 2"]}
            placeholder="Categoria"
          />
        </div>
        <div class="flex flex-row gap-2 mb-4">
          <.input type="checkbox" value="" name="only_correct" label="Apenas corretas" />
          <.input type="checkbox" value="" name="only_correct" label="Apenas corretas" />
          <.input type="checkbox" value="" name="only_correct" label="Apenas corretas" />
          <.input type="checkbox" value="" name="only_correct" label="Apenas corretas" />
        </div>
        <button class="btn btn-block">Filtrar</button>
      </form>
    </div>
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
        {@questao.enunciado |> raw()}
      </div>
      <div>
        <ul class="list-inside mt-4 space-y-2">
          <.alternativa_option content="sim sim" correct={false} alternative="A" submitted?={false} />
          <.alternativa_option content="não não" correct={true} alternative="B" submitted?={false} />
          <.alternativa_option
            content="talvez não talvez não"
            correct={false}
            alternative="C"
            submitted?={false}
          />
          <.alternativa_option
            content="maybe sim maybe sim"
            correct={false}
            alternative="D"
            submitted?={false}
          />
          <.alternativa_option
            content="Alternativa E Alternativa E"
            correct={false}
            alternative="E"
            submitted?={false}
          />
        </ul>
      </div>
      <div class="divider"></div>
    </div>
    """
  end

  def alternativa_option(assigns) do
    ~H"""
    <li>
      <button
        type="button"
        class={[
          "btn btn-dash w-full justify-start text-left normal-case",
          "gap-4 p-1 h-auto min-h-0",
          @submitted? && @correct && "btn-success",
          @submitted? && !@correct && "opacity-60 cursor-not-allowed"
        ]}
      >
        
    <!-- Letra -->
        <div class={[
          "w-8 h-8 flex items-center justify-center shrink-0",
          @submitted? && @correct && "bg-success text-success-content",
          !@submitted? && "text-base-content"
        ]}>
          {@alternative}
        </div>
        
    <!-- Conteúdo -->
        <div class="flex-1 leading-relaxed">
          {@content}
        </div>
      </button>
    </li>
    """
  end

  def handle_event("search", _params, socket) do
    scope = socket.assigns.current_scope

    questoes =
      Questoes.search_questoes(
        %{palavra_chave: "oi", banca: "fuvest", area_conhecimento: "fisica"},
        scope
      )

    {:noreply, assign(socket, :questoes, questoes)}
  end
end
