defmodule Tree do
    alias Tree.Node

    def build do
        event_data = %{name: :root}

        session_x_data = %{name: :session_x}
        session_y_data = %{name: :session_y}

        ticket_a_data = %{name: :ticket_a}
        ticket_b_data = %{name: :ticket_b}

        # Nodes
        event = event_data |> Node.new

        session_x = session_x_data |> Node.new
        session_y = session_y_data |> Node.new

        ticket_a = ticket_a_data |> Node.new
        ticket_b = ticket_b_data |> Node.new

        # Creating Tree
        session_x = session_x
        |> Node.add_child(ticket_b)

        session_y = session_y
        |> Node.add_child(ticket_b)
        |> Node.add_child(ticket_a)

        event = event
        |> Node.add_child(session_x)

        event = event
        |> Node.add_child(session_y)
    end
end