defmodule Hub.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :text, :text
      add :created_by, :string
      add :question_id, references(:questions)

      timestamps()
    end
  end
end
