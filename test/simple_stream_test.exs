defmodule SimpleStreamTest do
  use ExUnit.Case
  doctest SimpleStream

  test "greets the world" do
    assert SimpleStream.hello() == :world
  end
end
