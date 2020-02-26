require Logger

alias Tree

Benchee.run(%{
    "tree.build" => fn -> Tree.build end
})
