defmodule ImageEditorTest do
  use ExUnit.Case
  doctest ImageEditor

  test "new/1 creates new image with default color" do
    assert ImageEditor.create_new_image(1, 1) == [[O]]
    assert ImageEditor.create_new_image(2, 2) == [[O, O], [O, O]]
    assert ImageEditor.create_new_image(1, 3) == [[O], [O], [O]]
  end

  test "reset_color of image to default color" do
    assert ImageEditor.reset_image_color([[D, D]]) == [[O, O]]
    assert ImageEditor.reset_image_color([[D, Z], [Z, Z], [Z, O]]) == [[O, O], [O, O], [O, O]]
  end

  test "color pixel X, Y with given color" do
    assert ImageEditor.apply_color([[P, P, P]], 1, 1, D) == [[D, P, P]]
    assert ImageEditor.apply_color([[J, J, J], [J, L, L]], 2, 1, M) == [[J, M, J], [J, L, L]]
  end

  test "draw horizontal segment with given color in specified coordinates" do
    assert ImageEditor.drawing_horizontal_segment([[O, O]], 1, 1, 1, C) == [[C, O]]

    assert ImageEditor.drawing_horizontal_segment([[O, O], [Z, O], [O, O]], 1, 2, 2, D) == [
             [O, O],
             [D, D],
             [O, O]
           ]

    assert ImageEditor.drawing_horizontal_segment(
             [[J, J, J], [J, J, J], [J, J, J], [J, J, J], [J, J, J]],
             1,
             3,
             3,
             W
           ) == [[J, J, J], [J, J, J], [W, W, W], [J, J, J], [J, J, J]]
  end

  test "draw vertical segment with given color in specified coordinates" do
    assert ImageEditor.drawing_vertical_segment([[O, O]], 1, 1, 1, C) == [[C, O]]

    assert ImageEditor.drawing_vertical_segment([[O, O], [Z, O], [O, O]], 1, 2, 3, D) == [
             [O, O],
             [D, O],
             [D, O]
           ]
  end

  test "Fill the region R with the given color" do
    assert ImageEditor.fill_region([[O, O], [O, O]], 2, 1, J) == [[J, J], [J, J]]

    assert ImageEditor.fill_region(
             [[O, O, O, O], [O, O, W, O], [O, O, O, O], [O, O, O, O]],
             3,
             3,
             D
           ) == [[D, D, D, D], [D, D, W, D], [D, D, D, D], [D, D, D, D]]

    assert ImageEditor.fill_region(
             [[O, O, O, O], [O, O, W, O], [O, O, O, O], [O, O, O, O]],
             3,
             3,
             D
           ) == [[D, D, D, D], [D, D, W, D], [D, D, D, D], [D, D, D, D]]

    assert ImageEditor.fill_region(
             [[O, O, O, O], [O, O, O, O], [A, A, O, O], [O, O, W, W]],
             2,
             4,
             K
           ) == [[O, O, O, O], [O, O, O, O], [A, A, O, O], [K, K, W, W]]
  end
end
