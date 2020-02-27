defmodule Tree.Schema.Session do
    use Ecto.Schema
    import Ecto.Changeset

    alias Tree.Schema.Ticket

    @fields ~w(
        id
        title
    )a

    @primary_key false
    embedded_schema do
        field :id,    :integer
        field :title, :string

        embeds_many :tickets, Ticket
    end

    def changeset(params) do
        %__MODULE__{}
        |> cast(params, @fields)
    end

    def add_embedded(entity, embedded) do
        entity
        |> put_embed(:tickets, embedded)
    end
end