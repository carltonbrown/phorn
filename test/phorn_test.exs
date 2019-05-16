defmodule PhornTest do
  use ExUnit.Case

  test "builds a random alpha string of certain length" do
    max = 8
    built = Phorn.string(max)
    assert String.length(built) == max
  end

  test "detects initial position when maxlen = len = 1" do
    assert Phorn.position_at("q", 1) == :initial
  end

  test "detects the initial position when maxlen is 2" do
    assert Phorn.position_at("q", 2) == :initial
  end

  test "detects the initial position when maxlen is > 2" do
    assert Phorn.position_at("q", 3) == :initial
  end

  test "detects the sequential position" do
    assert Phorn.position_at("nn", 4) == :sequential
  end

  test "detects the final position" do
    assert Phorn.position_at("nnn", 4) == :final
  end

  test "bulk gen detects dups" do
    count = 10
    inspect_every = 1
    catch_error Phorn.bulk_gen(9, count, ["foobarqz", "foobarqz"], inspect_every)
  end

  # @tag :skip
  test "meets percent uniq" do
    count = 10_000_000
    inspect_every = 5000
    # count = 10000
    phorns = Phorn.bulk_gen(9, count, [], inspect_every)
    pct_uniq = 100 * (length(Enum.uniq(phorns)) / length(phorns))
    IO.puts "Percent uniq is #{pct_uniq}"
    assert pct_uniq >= 99.99
  end
end
