defmodule ImageEditor do
  @moduledoc """
  Documentation for `ImageEditor`.

  """
  @doc """
  Initializes the new state of an image, takes a two integers which are column and row respectively
  and returns an images whose pixels have

  ## Example
    iex> ImageEditor.create_new_image(2, 2)
    [[O, O], [O, O]]


  """
  @spec create_new_image(integer(), integer()) :: list()
  def create_new_image(column, row) do
    for _ <- 1..row, do: for(_ <- 1..column, do: O)
  end

  @spec reset_image_color(list()) :: list()
  def reset_image_color(current_image) do
    Enum.map(current_image, fn selected_row ->
      Enum.map(selected_row, fn _selected_pixel -> O end)
    end)
  end

  @spec apply_color(list(), integer(), integer(), any()) :: list()
  def apply_color(current_image, column, row, color) do
    new_image =
      current_image
      |> Enum.at(row - 1)
      |> List.replace_at(column - 1, color)

    List.replace_at(current_image, row - 1, new_image)
  end

  @spec drawing_horizontal_segment(list(), integer(), integer, integer(), any()) :: list()
  def drawing_horizontal_segment(current_image, start_column, end_column, row, color) do
    row = row - 1
    start_column = start_column - 1
    end_column = end_column - 1

    new_image =
      current_image
      |> Enum.at(row)
      |> Enum.with_index()
      |> Enum.map(fn {key, value} ->
        if value in start_column..end_column, do: color, else: key
      end)

    List.replace_at(current_image, row, new_image)
  end

  @spec drawing_vertical_segment(list(), integer(), integer, integer(), any()) :: list()
  def drawing_vertical_segment(current_image, column, start_row, end_row, color) do
    start_row = start_row - 1
    column = column - 1
    end_row = end_row - 1

    current_image
    |> Enum.with_index()
    |> Enum.map(fn {key, value} ->
      if value in start_row..end_row, do: List.replace_at(key, column, color), else: key
    end)
  end

  # def fill_region(current_image, column, row, color) do
  #   current_image
  #   # |> Enum.map(fn x -> Enum.map(x -> if x == color color, else: x end)end)
  # end
end
