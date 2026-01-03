defmodule Questoex.Questoes do
  alias Questoex.Questoes.{Questao, Opcao}
  alias Questoex.Repo

  def change_questao(attrs) do
    attrs
    |> Questao.changeset()
  end

  def create_questao(attrs) do
    attrs
    |> Questao.changeset()
    |> Repo.insert()
  end
end
