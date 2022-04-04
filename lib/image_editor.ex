defmodule ImageEditor do
  @moduledoc """
  Documentation for `ImageEditor`.

  """
  @doc """
  Initializes the new state of an image, takes a two integers which are column and row respectively
  and returns an images whose pixels have

  ## Example
    iex> ImageEditor.new(2, 2)
    [[O, O], [O, O]]


  """
  @spec new(integer(), integer()) :: list()
  def new(column, row) do
    for _ <- 1..row, do: for(_ <- 1..column, do: O)
  end

  @spec reset_color(list()) :: list()
  def reset_color(current_image) do
    Enum.map(current_image, fn x -> Enum.map(x, fn _y -> O end) end)
  end

  @spec color_pixel(list(), integer(), integer(), any()) :: list()
  def color_pixel(current_image, column, row, color) do
    x =
      current_image
      |> Enum.at(row - 1)
      |> List.replace_at(column - 1, color)

    List.replace_at(current_image, row - 1, x)
  end

  @spec horizontal_segment(list(), integer(), integer, integer(), any()) :: list()
  def horizontal_segment(current_image, column1, column2, row, color) do
    row = row - 1
    column1 = column1 - 1
    column2 = column2 - 1

    ok =
      current_image
      |> Enum.at(row)
      |> Enum.with_index()
      |> Enum.map(fn {c, i} -> if i in column1..column2, do: color, else: c end)

    List.replace_at(current_image, row, ok)
  end
end
