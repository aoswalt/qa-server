defmodule HubDB.Answer do
  use Ecto.Schema

  import Ecto.Changeset

  alias HubDB.{Question, User}

  schema "answers" do
    field :text, :string
    belongs_to :created_by_user, User, foreign_key: :created_by, type: :string
    belongs_to :question, Question

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:text, :created_by, :question_id])
    |> validate_required([:text, :created_by, :question_id])
    |> assoc_constraint(:created_by_user)
    |> assoc_constraint(:question)
  end
end
