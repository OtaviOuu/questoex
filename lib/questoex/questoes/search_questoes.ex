defmodule Questoex.Questoes.SearchQuestoes do
  alias Questoex.Questoes.{Questao, SearchQuestoesInput}

  import Ecto.Query
  alias Questoex.Repo

  def call(%SearchQuestoesInput{} = filter_attrs) do
    filter_attrs
    |> build_search_query()
    |> Repo.all()
  end

  defp build_search_query(%SearchQuestoesInput{} = _filter_attrs) do
    Questao
  end
end
