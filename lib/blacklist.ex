defmodule Blacklist do

  def get(:initial, str) do
    map = %{
      "b" => "cbdfgjkmnpqstvxz",
      "c" => "bcdfgjkmpqstvwxy",
      "d" => "bdcfgkmpqstxz",
      "f" => "bcdghkmpqstvxz",
      "g" => "bcfgkmpqstvxz",
      "h" => "bcdfghjkpqtvwxz",
      "i" => "wy",
      "j" => "bcdfgjkmnpqstvxz",
      "k" => "bcdfgkjmpqtxz",
      "l" => "bcdfgjkmnpqrstvwxz",
      "m" => "cdfgjkmqtvxz",
      "n" => "cfghklmnpqtx",
      "p" => "bcdgjkmpqvxz",
      "q" => "bcdfghjklmnopqrstvwxz",
      "r" => "cgijlprtqwx",
      "s" => "dsqx",
      "t" => "cdfgpqtx",
      "u" => "y",
      "v" => "bcdfgjklmnpqstvwxz",
      "w" => "bcdfgjklmnpqstvwxz",
      "x" => "abcdfgjklmnopqrtusvwxz",
      "y" => "bcdfghjkmnopqtvwxyz",
      "z" => "cfkjpqstvwx"
    }
    MapSet.new(String.graphemes(map[str] || ""))
  end

  def get(:sequential, str) do
    map = %{
      "b" => "qx",
      "d" => "x",
      "g" => "q",
      "h" => "hqx",
      "i" => "iwy",
      "j" => "bcjklpsxz",
      "k" => "cqx",
      "m" => "x",
      "o" => "h",
      "p" => "bx",
      "q" => "acghjkoquwxy",
      "s" => "x",
      "t" => "x",
      "u" => "w",
      "v" => "cpsvwx",
      "w" => "qx",
      "x" => "gsz",
      "y" => "hiqy",
      "z" => "jsx"
    }
    MapSet.new(String.graphemes(map[str] || ""))
  end

  def get(:final, str) do
    map = %{
      "b" => "cjkpwv",
      "c" => "bgjnqwv",
      "d" => "ckj",
      "f" => "bdvwz",
      "g" => "bfpqw",
      "h" => "dwy",
      "i" => "wy",
      "k" => "bcgjnpqw",
      "l" => "w",
      "m" => "gjw",
      "n" => "bjpw",
      "j" => "bcfgmnpqsvwxz",
      "p" => "gjqv",
      "q" => "abcdegjkmnopqtuvwxz",
      "s" => "bdjv",
      "t" => "cdgp",
      "u" => "y",
      "v" => "bcfpqvw",
      "w" => "bghjrqv",
      "x" => "bcdefgjkpqsvwxz",
      "y" => "chwxy",
      "z" => "s"
    }
    MapSet.union(get(:sequential, str), MapSet.new(String.graphemes(map[str] || "")))
  end
end
