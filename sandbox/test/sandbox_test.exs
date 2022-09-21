defmodule SandboxTest do
  use ExUnit.Case
  doctest Sandbox

  test "greets the world" do
    assert Sandbox.hello() == :world
  end
end

defmodule ExampleTest do
  use ExUnit.Case
  doctest ExampleTest

  test "greets the world" do
    assert sandbox.hello() == :world
  end
end
