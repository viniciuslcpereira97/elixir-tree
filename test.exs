require Logger
alias Tree
alias Tree.Schema.{
    Event,
    Session,
    Ticket
}

event =
    %{id: 18032, title: "DevTeam"}
    |> Event.changeset()

ticket_x = 
    %{id: 61533, title: "Ticket X"}
    |> Ticket.changeset()

ticket_y = 
    %{id: 61534, title: "Ticket Y"}
    |> Ticket.changeset()

ticket_z = 
    %{id: 61535, title: "Ticket Z"}
    |> Ticket.changeset()

session_a =
    %{id: 21690, title: "Session A"}
    |> Session.changeset()
    |> Session.add_embedded([ticket_x])

session_b =
    %{id: 21691, title: "Session B"}
    |> Session.changeset()
    |> Session.add_embedded([ticket_y, ticket_z])

sessions = [session_a, session_b]

event =
    event
    |> Event.add_embedded(sessions)

    
Benchee.run(%{
    "tree.build" => fn -> Tree.build(event) end
})
