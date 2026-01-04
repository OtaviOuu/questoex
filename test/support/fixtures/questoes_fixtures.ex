defmodule Questoex.QuestoesFixtures do
  alias Questoex.Questoes
  alias Questoex.AccountsFixtures

  def questao_fixture(attrs \\ %{}) do
    scope = AccountsFixtures.user_scope_fixture()

    {:ok, questao} =
      attrs
      |> Questoes.change_questao()
      |> Questoes.create_questao(scope)

    questao
  end
end
