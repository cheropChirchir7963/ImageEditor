defmodule ImageEditor.Cli do
  def parser(["I", column, row]) when is_integer(row) and is_integer(column) do
    row
    |> ImageEditor.new(column)
    |> ImageEditor.Server.start_link()
  end

  def parser(["S"]) do
    ImageEditor.Server.show()
  end

  def parser(["C"]) do
    ImageEditor.Server.show()
    |> ImageEditor.reset_color()
    |> ImageEditor.Server.update_state()
  end
  
end
