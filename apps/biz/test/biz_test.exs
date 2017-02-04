defmodule BizTest do
  use ExUnit.Case
  doctest Biz

  test "ping" do
    assert Biz.ping == :pong
  end
end
