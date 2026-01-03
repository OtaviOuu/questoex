defmodule Questoes.Questao do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:enunciado, :area_conhecimento]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "questoes" do
    field :enunciado, :string
    field :area_conhecimento, Ecto.Enum, values: [:matematica, :fisica]
    belongs_to :prova, Questoes.Prova, type: :binary_id
    has_many :opcoes, Questoes.Opcao

    timestamps()
  end

  def changeset(questao, attrs) do
    questao
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
