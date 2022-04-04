defmodule ImageEditor.Cli do
  def parser(["I", column, row]) when is_integer(row) and is_integer(column) do
    row
    |> ImageEditor.new(column)
    |> ImageEditor.Server.start_link()
  end
end