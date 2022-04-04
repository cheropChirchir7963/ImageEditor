defmodule ImageEditorTest do
  use ExUnit.Case
  doctest ImageEditor

  test "new/1 creates new image with default color" do
    assert ImageEditor.new(1, 1) == [[O]]
    assert ImageEditor.new(2, 2) == [[O, O], [O, O]]
    assert ImageEditor.new(1, 3) == [[O], [O], [O]]
  end

  test "reset_color of image to default color" do
    assert ImageEditor.reset_color([[D, D]]) == [[O, O]]
    assert ImageEditor.reset_color([[D, Z], [Z, Z], [Z, O]]) == [[O, O], [O, O], [O, O]]
  end
end
