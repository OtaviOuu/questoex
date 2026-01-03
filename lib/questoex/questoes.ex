defmodule Questoex.Questoes do
  alias Questoex.Questoes.{Questao, Opcao}
  alias Questoex.Repo
  @behaviour Bodyguard.Policy

  def authorize(:create_questao, %{user: %{is_admin: true}}), do: :ok
  def authorize(:create_questao, _), do: {:error, :unauthorized}

  def change_questao(attrs) do
    attrs
    |> Questao.changeset()
  end

  def create_questao(attrs, scope) do
    with :ok <- Bodyguard.permit(__MODULE__, :create_questao, scope) do
      attrs
      |> Questao.changeset()
      |> Repo.insert()
    end
  end
end
