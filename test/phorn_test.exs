defmodule PhornTest do
  use ExUnit.Case

  test "builds a random alpha string of certain length" do
    max = 8
    built = Phorn.string(max)
    assert String.length(built) == max
  end

  test "detects initial position when maxlen = len = 1" do
    assert Phorn.position_at('q', 1) == :initial
  end

  test "detects the initial position when maxlen is 2" do
    assert Phorn.position_at('q', 2) == :initial
  end

  test "detects the initial position when maxlen is > 2" do
    assert Phorn.position_at('q', 3) == :initial
  end

  test "detects the sequential position" do
    assert Phorn.position_at('nn', 4) == :sequential
  end

  test "detects the final position" do
    assert Phorn.position_at('nnn', 4) == :final
  end

  @tag :skip
  test "greater than 99.999% unique for 9-length strings\n" do
    sample_size = 500000
    inspect_every = 5000
    phorns = Phorn.bulk_gen(9, sample_size, [], inspect_every)
    pct_uniq = 100 * (length(Enum.uniq(phorns)) / length(phorns))
    IO.puts "\n#{pct_uniq}% unique over #{sample_size} iterations"
    assert pct_uniq >= 99.999
  end

  test "greater than 99.998% unique for 8-length strings\n" do
    sample_size = 50000
    inspect_every = 5000
    phorns = Phorn.bulk_gen(8, sample_size, [], inspect_every)
    pct_uniq = 100 * (length(Enum.uniq(phorns)) / length(phorns))
    IO.puts "\n#{pct_uniq}% unique over #{sample_size} iterations"
    assert pct_uniq >= 99.999
  end
end
