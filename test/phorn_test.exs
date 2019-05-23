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

  def pct_uniq(string_length, sample_size, inspect_every \\ 5000) do 
    IO.puts "\n"
    phorns = Phorn.bulk_gen(string_length, sample_size, [], inspect_every)
    result = 100 * (length(Enum.uniq(phorns)) / length(phorns))
    IO.puts "\n#{result}% unique over #{sample_size} iterations"
    result
  end

  @tag :skip
  test "uniqueness for 9-length strings\n" do
    assert pct_uniq(9, 500000) >= 99.999
  end

  test "uniqueness for 8-length strings\n" do
    assert pct_uniq(8, 100000) >= 99.999
  end
end
