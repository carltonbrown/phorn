defmodule Blacklist do


  @blacklist %{
    :initial => %{
      ?a => '',
      ?b => 'cbdfgjkmnpqstvxz',
      ?c => 'bcdfgjkmpqstvwx',
      ?d => 'bdcfgkpqstx',
      ?e => '',
      ?f => 'bcdghkmpqstvxz',
      ?g => 'bcfgkmpqstvxz',
      ?h => 'bcdfghjkpqtvwxz',
      ?i => 'iwy',
      ?j => 'bcdfgjkmnpqstvxz',
      ?k => 'bcdfgkjmpqtxz',
      ?l => 'bcdfgjkmnpqrstvwxz',
      ?m => 'cdfgjkmqtvxz',
      ?n => 'cfghklmnpqtx',
      ?o => '',
      ?p => 'bcdgjkmpqvxz',
      ?q => '',
      ?r => 'cgjlprtqwx',
      ?s => 'dsqx',
      ?t => 'cdfgpqtx',
      ?u => 'y',
      ?v => 'bcdfgjklmnpqstvwxz',
      ?w => 'bcdfgjklmnpqstvwxz',
      ?x => 'abcdfgjklmnopqrtusvwxz',
      ?y => 'cdfhjkmnqvwxyz',
      ?z => 'cfkjpqstvwx'
    } |> Map.new(fn {k, v} -> {k, MapSet.new(v)} end),
    :sequential => %{
      ?a => '',
      ?b => 'qx',
      ?c => 'xy',
      ?d => 'x',
      ?e => '',
      ?f => 'vx',
      ?g => 'q',
      ?h => 'hqx',
      ?i => 'iwy',
      ?j => 'jklpsxz',
      ?k => 'cqx',
      ?l => '',
      ?m => 'x',
      ?n => '',
      ?o => 'h',
      ?p => 'bx',
      ?q => 'acghjkoquwxy',
      ?r => '',
      ?s => 'x',
      ?t => 'x',
      ?u => 'w',
      ?v => 'cvx',
      ?w => 'qx',
      ?x => 'gsz',
      ?y => 'iy',
      ?z => 'x'
    } |> Map.new(fn {k, v} -> {k, MapSet.new(v)} end),
    :final => %{
      ?a => '',
      ?b => 'cdjkjpqwxv',
      ?c => 'bgjnpqwxv',
      ?d => 'ckjqvx',
      ?e => '',
      ?f => 'bdjvwxz',
      ?g => 'bcfjkpqwx',
      ?h => 'dhjqxwy',
      ?i => 'iwy',
      ?j => 'bcfghkmnpqsvwxz',
      ?k => 'bcdgjnpqwx',
      ?l => 'w',
      ?m => 'gjwx',
      ?n => 'bw',
      ?o => '',
      ?p => 'bgjqvwx',
      ?q => 'bcdeghjkmnpqtuvwxyz',
      ?r => 'jw',
      ?s => 'bdjvx',
      ?t => 'dgjpx',
      ?u => 'wy',
      ?v => 'bcfpqsvwx',
      ?w => 'bghjrqvx',
      ?x => 'bcdfgjkpqsvwxz',
      ?y => 'hiwy',
      ?z => 'jsx'
    } |> Map.new(fn {k, v} -> {k, MapSet.new(v)} end)
  }

  def get(rule, char) when rule in [:initial, :sequential, :final] do
    @blacklist[rule][char]
  end
end
