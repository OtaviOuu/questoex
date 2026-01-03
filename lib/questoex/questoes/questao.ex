defmodule Questoex.Questoes.Questao do
  use Ecto.Schema
  import Ecto.Changeset
  alias Questoex.Questoes
  @fields [:enunciado, :area_conhecimento]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "questoes" do
    field :enunciado, :string
    field :area_conhecimento, Ecto.Enum, values: [:matematica, :fisica]

    field :alternativa_a, :string
    field :alternativa_b, :string
    field :alternativa_c, :string
    field :alternativa_d, :string
    field :alternativa_e, :string

    belongs_to :prova, Questoes.Prova, type: :binary_id

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
