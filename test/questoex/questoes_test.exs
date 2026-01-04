defmodule Questoex.QuestoesTest do
  use Questoex.DataCase

  alias Questoex.QuestoesFixtures
  alias Questoex.Questoes

  @questao_valid_attrs %{
    enunciado: "What is 2 + 2?",
    area_conhecimento: :matematica,
    alternativa_a: "3",
    alternativa_b: "4",
    alternativa_c: "5",
    alternativa_d: "6",
    alternativa_e: "7"
  }

  @admin_scope %{user: %{is_admin: true}}
  @non_admin_scope %{user: %{is_admin: false}}

  describe "create_questao/2" do
    test "admin creates a questao with valid data" do
      {:ok, questao} = Questoes.create_questao(@questao_valid_attrs, @admin_scope)

      assert questao.enunciado == "What is 2 + 2?"
      assert questao.area_conhecimento == :matematica
      assert questao.alternativa_b == "4"
      assert questao.alternativa_a == "3"
      assert questao.alternativa_c == "5"
      assert questao.alternativa_d == "6"
      assert questao.alternativa_e == "7"
    end

    test "non admin cant creates a questao with valid data" do
      {:error, reason} = Questoes.create_questao(@questao_valid_attrs, @non_admin_scope)

      assert reason == :unauthorized
    end
  end
end
