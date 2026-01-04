defmodule Questoex.Questoes.SearchQuestoesInput do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :palavra_chave, :string
    field :banca, Ecto.Enum, values: [:fuvest, :enem]
    field :area_conhecimento, Ecto.Enum, values: [:matematica, :fisica]
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:palavra_chave, :banca, :area_conhecimento])
    |> validate_length(:palavra_chave, max: 100)
    |> validate_inclusion(:banca, [:fuvest, :enem])
    |> validate_inclusion(:area_conhecimento, [:matematica, :fisica])
  end

  def new(attrs) do
    changeset = changeset(attrs)

    case changeset.valid? do
      true -> {:ok, apply_changes(changeset)}
      false -> {:error, changeset}
    end
  end
end
