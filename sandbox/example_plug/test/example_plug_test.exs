defmodule ExamplePlugTest do
  use ExUnit.Case
  doctest ExamplePlug

  test "greets the world" do
    assert ExamplePlug.hello() == :world
  end
end
