defmodule Phorn do

  def charset(:all) do
    MapSet.new(?a..?z)
  end

  def charset(:vowels) do
    MapSet.new('aeiouy')
  end

  def charset(:consonants) do
    MapSet.difference(charset(:all), charset(:vowels))
  end

  def string(maxlen) do
    acc = [Enum.random(charset(:all))]
    get_chars(acc, maxlen, length(acc))
  end

  def position_at(acc, maxlen) do
    require IEx;
    #  IEx.pry 
    count = length(acc)
    cond do
      count == 1 or maxlen == 2 -> 
        :initial
      count > 1 and maxlen - count > 1 ->
        :sequential
      maxlen - count == 1 ->
        :final
    end
  end

  def get_chars(acc, maxlen, length) when length < maxlen do
    current = List.first(acc)
    # If last n chars are consonants, next should be a vowel
    # If last n chars are vowels, next should be a consonant
    n = 2 
    last_n = Enum.slice(acc,0..n)
    num_vowels = length(Enum.filter(last_n, fn x -> Enum.member?(charset(:vowels), x) end))
    num_consonants = length(Enum.filter(last_n, fn x -> Enum.member?(charset(:consonants), x) end))
    prependage = cond do
      num_vowels >= 2 ->
        follows(current, position_at(acc, maxlen), :consonants) 
      num_consonants >= 2 ->
        follows(current, position_at(acc, maxlen), :vowels) 
      num_vowels < 2 && num_consonants < 2 ->
        follows(current, position_at(acc, maxlen), :all) 
    end

    acc = [ prependage | acc ]
    require IEx; IEx.pry
    get_chars(acc, maxlen, length(acc))
  end

  def get_chars(acc, maxlen, length) when length == maxlen do
    to_string(Enum.reverse(acc))
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
    superset = charset(kind)
    Enum.random(MapSet.difference(superset, Blacklist.get(pos, str)))
  end

  def bulk_gen(maxlen, count, cumulative \\ MapSet.new([]), inspect_every \\ 1000)

  def bulk_gen(maxlen, count, cumulative, inspect_every) when count > 0 do
    next = string(maxlen)
    if MapSet.member?(cumulative,next) do
      raise "Dup found in set of #{MapSet.size(cumulative)}: #{next}"
    end
    cumulative = MapSet.put(cumulative,next)
    if rem(MapSet.size(cumulative),inspect_every) == 0 do
      IO.puts "#{MapSet.size(cumulative)} #{next}"
    end
    bulk_gen(maxlen, count-1, cumulative, inspect_every)
  end

  def bulk_gen(_, count, cumulative, _) when count <= 0 do
    cumulative
  end
end
