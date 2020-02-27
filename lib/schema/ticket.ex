defmodule Tree.Schema.Ticket do
    use Ecto.Schema
    import Ecto.Changeset

    @fields ~w(
        id
        title
    )a

    @primary_key false
    embedded_schema do
        field :id,    :integer
        field :title, :string
    end

    def changeset(params) do
        %__MODULE__{}
        |> cast(params, @fields)
    end

    def add_embedded(entity, embedded) do
        entity
        |> cast_embed(embedded)
    end
end