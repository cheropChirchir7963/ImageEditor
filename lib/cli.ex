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

  def parser(["L", column, row, color]) when is_integer(row) and is_integer(column) do
    ImageEditor.Server.show()
    |> ImageEditor.color_pixel(column, row, color)
    |> ImageEditor.Server.update_state()
  end

  def parser(["H", column1, column2, row, color]) do
    ImageEditor.Server.show()
    |> ImageEditor.horizontal_segment(column1, column2, row, color)
    |> ImageEditor.Server.update_state()
  end
end
