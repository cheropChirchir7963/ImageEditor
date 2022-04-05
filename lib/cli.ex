defmodule ImageEditor.Cli do
  def parser([I, column, row]) when is_integer(row) and is_integer(column) do
    row
    |> ImageEditor.create_new_image(column)
    |> ImageEditor.Server.start_link()
  end

  def parser([S]) do
    ImageEditor.Server.show()
  end

  def parser([C]) do
    ImageEditor.Server.show()
    |> ImageEditor.reset_image_color()
    |> ImageEditor.Server.update_state()
  end

  def parser([L, column, row, color]) when is_integer(row) and is_integer(column) do
    ImageEditor.Server.show()
    |> ImageEditor.apply_color(column, row, color)
    |> ImageEditor.Server.update_state()
  end

  def parser([H, start_column, end_column, row, color]) do
    ImageEditor.Server.show()
    |> ImageEditor.drawing_horizontal_segment(start_column, end_column, row, color)
    |> ImageEditor.Server.update_state()
  end

  def parser([V, column, start_row, end_row, color]) do
    ImageEditor.Server.show()
    |> ImageEditor.drawing_vertical_segment(column, start_row, end_row, color)
    |> ImageEditor.Server.update_state()
  end

  def parser([X]) do
    ImageEditor.Server.stop()
  end
end
