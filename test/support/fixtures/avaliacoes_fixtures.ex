defmodule Questoex.AvaliacoesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Questoex.Avaliacoes` context.
  """

  @doc """
  Generate a avaliacao.
  """
  def avaliacao_fixture(scope, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        name: "some name"
      })

    {:ok, avaliacao} = Questoex.Avaliacoes.create_avaliacao(scope, attrs)
    avaliacao
  end
end
