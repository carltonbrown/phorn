defmodule Blacklist do


  @blacklist %{
    :initial => %{
      ?a => '',
      ?b => 'cbdfgjkmnpqstvxz',
      ?c => 'bcdfgjkmpqstvwx',
      ?d => 'bdcfgkpqstx',
      ?e => '',
      ?f => 'bcdghjkmpqstvxz',
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
      ?q => 'bcdfgjkmpqstvwxz',
      ?r => 'cgjlprtqwx',
      ?s => 'dsqx',
      ?t => 'cdfgpqtx',
      ?u => 'y',
      ?v => 'bcdfgjklmnpqstvwxz',
      ?w => 'bcdfgjklmnpqstvwxz',
      ?x => 'abcdefghjklmnopqrtusvwxyz',
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
      ?h => 'hjqx',
      ?i => 'iwy',
      ?j => 'jklpqsxz',
      ?k => 'cqx',
      ?l => '',
      ?m => 'x',
      ?n => '',
      ?o => 'h',
      ?p => 'bx',
      ?q => 'acghjkoqrwxy',
      ?r => '',
      ?s => 'x',
      ?t => 'x',
      ?u => 'w',
      ?v => 'cvx',
      ?w => 'qx',
      ?x => 'gsz',
      ?y => 'aeioquwy',
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
      ?m => 'gjqwx',
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
      ?y => 'chiwy',
      ?z => 'jsx'
    } |> Map.new(fn {k, v} -> {k, MapSet.new(v)} end)
  }

  def get(rule, char) when rule in [:initial, :sequential, :final] do
    @blacklist[rule][char]
  end
end
