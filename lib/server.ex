defmodule ImageEditor.Server do
  use Agent

  ## server
  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end
end
