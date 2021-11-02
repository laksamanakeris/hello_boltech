defmodule HelloBoltechTest do
  use ExUnit.Case
  doctest HelloBoltech

  test "greets the world" do
    assert HelloBoltech.hello() == :world
  end
end
