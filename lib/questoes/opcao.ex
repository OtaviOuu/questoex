defmodule Questoes.Opcao do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opcoes" do
    field :alternativa, Ecto.Enum, values: [:A, :B, :C, :D, :E, :F]
    field :texto, :string
    field :is_correta, :boolean

    belongs_to :questao, Questoes.Questao

    timestamps()
  end

  def changeset(opcao, attrs) do
    opcao
    |> cast(attrs, [:alternativa, :texto, :is_correta, :questao_id])
    |> validate_required([:alternativa, :texto, :is_correta, :questao_id])
  end
end
