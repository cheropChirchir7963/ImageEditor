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

  @spec color_pixel(list(), integer(), integer(), any() ) :: list()
  def color_pixel(current_image, column, row, color) do
    x =
      current_image
      |> Enum.at(row - 1)
      |> List.replace_at(column - 1, color)

    List.replace_at(current_image, row - 1, x)
  end
  
end
