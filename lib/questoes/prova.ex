defmodule Questoes.Prova do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:titulo, :data_aplicacao]

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "provas" do
    field :banca, Ecto.Enum, values: [:fuvest, :comvest]
    field :data_aplicacao, :date

    has_many :questoes, Questoes.Questao

    timestamps()
  end

  def changeset(prova, attrs) do
    prova
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
