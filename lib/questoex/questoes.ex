defmodule Questoex.Questoes do
  alias Questoex.Questoes.{Questao, Opcao}

  def change_questao(attrs) do
    attrs
    |> Questao.changeset()
  end
end
