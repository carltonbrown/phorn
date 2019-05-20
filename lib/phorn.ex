defmodule Phorn do

  def chars(:all) do
    MapSet.new(Enum.map(?a..?z, fn x -> << x :: utf8 >> end))
  end

  def chars(:vowels) do
    MapSet.new(String.graphemes("aeiouy"))
  end

  def chars(:consonants) do
    MapSet.difference(chars(:all), chars(:vowels))
  end

  def string(maxlen) do
    acc = Enum.random(chars(:all))
    string(acc, maxlen, String.length(acc))
  end

  def position_at(acc, maxlen) do
    count = String.length(acc)
    cond do
      count == 1 or maxlen == 2 -> 
        :initial
      count > 1 and maxlen - count > 1 ->
        :sequential
      maxlen - count == 1 ->
        :final
    end
  end

  def string(acc, maxlen, length) when length < maxlen do
    current = String.last(acc)
    # If last n chars are consonants, next should be a vowel
    # If last n chars are vowels, next should be a consonant
    n = 2 
    last_n = String.graphemes(String.slice(acc, -n..-1))
    num_vowels = length(Enum.filter(last_n, fn x -> Enum.member?(chars(:vowels), x) end))
    num_consonants = length(Enum.filter(last_n, fn x -> Enum.member?(chars(:consonants), x) end))
    appendage = cond do
      num_vowels >= 2 ->
        follows(current, position_at(acc, maxlen), :consonants) 
      num_consonants >= 2 ->
        follows(current, position_at(acc, maxlen), :vowels) 
      num_vowels < 2 && num_consonants < 2 ->
        follows(current, position_at(acc, maxlen), :all) 
    end

    acc = acc <> appendage
    string(acc, maxlen, String.length(acc))
  end

  def string(acc, maxlen, length) when length == maxlen do
    acc
  end

  def tuple(tuple_count, tuple_size, tuples \\ [])

  def tuple(tuple_count, tuple_size, tuples) when tuple_count > 0 do
    tuples = [ string(tuple_size) | tuples ]
    tuple(tuple_count-1, tuple_size, tuples)
  end

  def tuple(tuple_count, _, tuples) when tuple_count < 1 do
    Enum.join(tuples, "-")
  end

  # when pos in :initial, sequential, final
  def follows(str, pos, kind) do
    superset = chars(kind)
    Enum.random(MapSet.difference(superset, Blacklist.get(pos, str)))
  end

  def bulk_gen(maxlen, count, list, inspect_every \\ 1000)

  def bulk_gen(maxlen, count, list, inspect_every) when count > 0 do
    next = string(maxlen)
    list = [ next | list ]
    if rem(length(list),inspect_every) == 0 do
      IO.puts "#{length(list)} #{next}"
      dups = list -- Enum.uniq(list)
      if length(dups) > 0 do
        [ first_dup | _ ] = dups
        position = Enum.find_index(Enum.reverse(list), fn x -> x == first_dup end)
        raise "Dups found at #{position} : #{dups}"
      end
    end
    bulk_gen(maxlen, count-1, list, inspect_every)
  end

  def bulk_gen(_, count, list, _) when count <= 0 do
    list
  end
end

