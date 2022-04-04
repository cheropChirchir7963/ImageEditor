defmodule ImageEditorTest do
  use ExUnit.Case
  doctest ImageEditor

  test "new/1 creates new image with default color" do
    assert ImageEditor.new(1, 1) == [[O]]
    assert ImageEditor.new(2, 2) == [[O, O], [O, O]]
    assert ImageEditor.new(1, 3) == [[O], [O], [O]]
  end
end
