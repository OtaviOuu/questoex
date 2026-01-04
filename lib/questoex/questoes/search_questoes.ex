defmodule Questoex.Questoes.SearchQuestoes do
  alias Questoex.Questoes.{Questao, SearchQuestoesInput}

  import Ecto.Query
  alias Questoex.Repo

  def call(%SearchQuestoesInput{} = filter_attrs) do
    filter_attrs
    |> build_search_query()
    |> Repo.all()
  end

  defp build_search_query(%SearchQuestoesInput{} = filter_attrs) do
    filter_attrs.from(q in Questao)
    |> maybe_filter_by_palavra_chave(filter_attrs.palavra_chave)
    |> maybe_filter_by_banca(filter_attrs.banca)
    |> maybe_filter_by_area_conhecimento(filter_attrs.area_conhecimento)
  end

  defp maybe_filter_by_palavra_chave(query, nil), do: query

  defp maybe_filter_by_palavra_chave(query, palavra_chave) do
    from(q in query, where: ilike(q.enunciado, ^"%#{palavra_chave}%"))
  end
end
