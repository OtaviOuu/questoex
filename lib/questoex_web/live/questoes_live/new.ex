defmodule QuestoexWeb.QuestoesLive.New do
  use QuestoexWeb, :live_view
  use CKEditor5

  alias Questoex.Questoes

  def mount(_params, _session, socket) do
    questao_chageset = Questoes.change_questao(%{})
    form = to_form(questao_chageset, as: :form)
    {:ok, assign(socket, form: form, preview: "")}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="max-w-4xl mx-auto p-4 bg-white shadow rounded-lg">
        <div class="mb-6 p-4 border border-gray-200 rounded-lg bg-gray-50
            prose max-w-none overflow-y-auto overflow-x-hidden break-words h-96">
          {@preview |> raw()}
        </div>

        <.form for={@form} phx-submit="save" phx-change="validate">
          <.ckeditor
            id="content-editor"
            editable_height="300px"
            field={@form[:enunciado]}
          />
          <div>
            <.input
              type="select"
              field={@form[:area_conhecimento]}
              label="Área de Conhecimento"
              options={[
                Matemática: :matematica,
                Física: :fisica
              ]}
            />
            <.input
              type="textarea"
              field={@form[:alternativa_a]}
              label="Alternativa A"
            />
            <.input
              type="textarea"
              field={@form[:alternativa_b]}
              label="Alternativa B"
            />
            <.input
              type="textarea"
              field={@form[:alternativa_c]}
              label="Alternativa C"
            />
            <.input
              type="textarea"
              field={@form[:alternativa_d]}
              label="Alternativa D"
            />
            <.input
              type="textarea"
              field={@form[:alternativa_e]}
              label="Alternativa E"
            />
          </div>
          <.button>Criar</.button>
        </.form>
      </div>
    </Layouts.app>
    """
  end

  def handle_event("validate", %{"form" => params}, socket) do
    changeset =
      params
      |> Questoes.change_questao()
      |> Map.put(:action, :validate)

    preview = Map.get(params, "enunciado", "")

    form = to_form(changeset, as: :form, action: :validate)
    {:noreply, assign(socket, form: form, preview: preview)}
  end

  def handle_event("save", %{"form" => attrs}, socket) do
    IO.inspect(attrs, label: "Attrs")

    case Questoes.create_questao(attrs) do
      {:ok, _questao} ->
        {:noreply,
         socket
         |> put_flash(:info, "Questão criada com sucesso!")
         |> push_navigate(to: ~p"/admin/questoes/ingestao")}

      {:error, %Ecto.Changeset{} = changeset} ->
        form = to_form(changeset, as: :form, action: :validate)
        {:noreply, assign(socket, form: form)}
    end
  end
end
