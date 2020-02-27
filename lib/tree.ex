defmodule Tree do
    alias Tree.Node

    def build(%{changes: changes, data: %Tree.Schema.Event{}} = _root) do
        childs = changes.sessions
        |> Enum.map(&build/1)

        %{name: changes.title, childs: childs}
        |> Node.new()
    end

    def build(%{changes: changes, data: %Tree.Schema.Session{}} = _root) do
        childs = changes.tickets
        |> Enum.map(&build/1)

        %{name: changes.title, childs: childs}
        |> Node.new()
    end

    def build(%{changes: changes, data: %Tree.Schema.Ticket{}} = _root) do
        %{name: changes.title}
        |> Node.new()
    end
end