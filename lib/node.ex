defmodule Tree.Node do
    @moduledoc false
    defstruct [:name, :childs]

    @doc false
    def new, do: %__MODULE__{}
    def new(%{name: name, childs: childs}), do: %__MODULE__{childs: childs, name: name}
    def new(%{name: name}), do: %__MODULE__{name: name}

    @doc false
    def add_child(%__MODULE__{} = parent, %__MODULE__{} = child) do
        %{name: parent.name, childs: merge_childs(parent.childs, child)}
        |> new()
    end

    defp merge_childs(nil, new), do: [new]
    defp merge_childs(current, new) when is_list(current) and is_list(new), do: current ++ new
    defp merge_childs(current, new) when is_list(current), do: current ++ [new]
end