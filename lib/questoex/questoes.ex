defmodule Questoex.Questoes do
  alias Questoex.Questoes.{Questao, Opcao, SearchQuestoesInput, SearchQuestoes}

  alias Questoex.Repo
  @behaviour Bodyguard.Policy

  def authorize(:create_questao, %{user: %{is_admin: true}}, _), do: :ok
  def authorize(:create_questao, _, _), do: {:error, :unauthorized}

  def authorize(:search_questoes, %{user: _}, _), do: :ok

  def change_questao(attrs) do
    attrs
    |> Questao.changeset()
  end

  def search_questoes(attrs, scope) do
    with :ok <- Bodyguard.permit(__MODULE__, :search_questoes, scope) do
      case SearchQuestoesInput.new(attrs) do
        {:ok, filter_attrs} ->
          SearchQuestoes.call(filter_attrs)

        {:error, changeset} ->
          {:error, changeset}
      end
    end
  end

  def create_questao(attrs, scope) do
    with :ok <- Bodyguard.permit(__MODULE__, :create_questao, scope) do
      attrs
      |> Questao.changeset()
      |> Repo.insert()
    end
  end
end
