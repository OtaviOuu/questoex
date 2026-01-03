defmodule Questoex.Repo.Migrations.CreateQuestoesTable do
  use Ecto.Migration

  def change do
    create table(:questoes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :enunciado, :text, null: false
      add :area_conhecimento, :string, null: false

      add :alternativa_a, :text, null: false
      add :alternativa_b, :text, null: false
      add :alternativa_c, :text, null: false
      add :alternativa_d, :text, null: false
      add :alternativa_e, :text, null: true

      timestamps()
    end
  end
end
