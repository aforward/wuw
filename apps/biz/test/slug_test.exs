defmodule Biz.SlugTest do
  use ExUnit.Case
  doctest Biz.Slug

  test "generate" do
    assert Biz.Slug.generate(nil) == "nil"
  end
end
