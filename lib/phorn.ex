defmodule Phorn do

  @on_load :seed_random

  def seed_random do
    << i1 :: unsigned-integer-32, i2 :: unsigned-integer-32, i3 :: unsigned-integer-32>> = :crypto.strong_rand_bytes(12)
    :rand.seed(:exsplus, {i1, i2, i3})
    :ok
  end

  def charset(:all) do
    MapSet.new(?a..?z)
  end

  def charset(:vowels) do
    MapSet.new('aeiouy')
  end

  def charset(:consonants) do
    MapSet.difference(charset(:all), charset(:vowels))
  end

  def reversed(maxlen) do
    acc = [Enum.random(charset(:all))]
    get_chars(acc, maxlen, length(acc))
  end

  def string(maxlen) do
    to_string(Enum.reverse(reversed(maxlen)))
  end

  def position_at(acc, maxlen) do
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
    rule = position_at(acc, maxlen)
    kind = cond do
      num_vowels >= 2 ->
        :consonants
      num_consonants >= 2 ->
        :vowels
      num_vowels < 2 && num_consonants < 2 ->
        :all
    end
    next = follows(current, rule, kind) 
    acc = [ next | acc ]
    get_chars(acc, maxlen, length(acc))
  end

  def get_chars(acc, maxlen, length) when length == maxlen do
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
  def follows(preceding, rule, kind_requested) do
    superset = charset(kind_requested)
    blacklist = Blacklist.get(rule, preceding)
    allowed = MapSet.difference(superset, blacklist)
    Enum.random(allowed)
  end

  def bulk_gen(maxlen, count, cumulative \\ [], inspect_every \\ 1000)

  def bulk_gen(maxlen, count, cumulative, inspect_every) when count > 0 do
    next = reversed(maxlen)
    cumulative = [ next | cumulative ]
    if rem(length(cumulative),inspect_every) == 0 do
      displayed = to_string(Enum.reverse(next))
      IO.puts "#{length(cumulative)} #{displayed}"
    end
    bulk_gen(maxlen, count-1, cumulative, inspect_every)
  end

  def bulk_gen(_, count, cumulative, _) when count <= 0 do
    cumulative
  end
end
