defmodule Blacklist do


  @blacklist %{
    :initial => %{
      ?b => 'cbdfgjkmnpqstvxz',
      ?c => 'bcdfgjkmpqstvwxy',
      ?d => 'bdcfgkmpqstxz',
      ?f => 'bcdghkmpqstvxz',
      ?g => 'bcfgkmpqstvxz',
      ?h => 'bcdfghjkpqtvwxz',
      ?i => 'wy',
      ?j => 'bcdfgjkmnpqstvxz',
      ?k => 'bcdfgkjmpqtxz',
      ?l => 'bcdfgjkmnpqrstvwxz',
      ?m => 'cdfgjkmqtvxz',
      ?n => 'cfghklmnpqtx',
      ?p => 'bcdgjkmpqvxz',
      ?q => 'bcdfghjklmnopqrstvwxz',
      ?r => 'cgijlprtqwx',
      ?s => 'dsqx',
      ?t => 'cdfgpqtx',
      ?u => 'y',
      ?v => 'bcdfgjklmnpqstvwxz',
      ?w => 'bcdfgjklmnpqstvwxz',
      ?x => 'abcdfgjklmnopqrtusvwxz',
      ?y => 'bcdfghjkmnopqtvwxyz',
      ?z => 'cfkjpqstvwx'
    },
    :sequential => %{
      ?b => 'qx',
      ?d => 'x',
      ?g => 'q',
      ?h => 'hqx',
      ?i => 'iwy',
      ?j => 'bcjklpsxz',
      ?k => 'cqx',
      ?m => 'x',
      ?o => 'h',
      ?p => 'bx',
      ?q => 'acghjkoquwxy',
      ?s => 'x',
      ?t => 'x',
      ?u => 'w',
      ?v => 'cpsvwx',
      ?w => 'qx',
      ?x => 'gsz',
      ?y => 'hiqy',
      ?z => 'jsx'
    },
    :final => %{
      ?b => 'cjkpwv',
      ?c => 'bgjnqwv',
      ?d => 'ckj',
      ?f => 'bdvwz',
      ?g => 'bfpqw',
      ?h => 'dwy',
      ?i => 'wy',
      ?k => 'bcgjnpqw',
      ?l => 'w',
      ?m => 'gjw',
      ?n => 'bjpw',
      ?j => 'bcfgmnpqsvwxz',
      ?p => 'gjqv',
      ?q => 'abcdegjkmnopqtuvwxz',
      ?s => 'bdjv',
      ?t => 'cdgp',
      ?u => 'y',
      ?v => 'bcfpqvw',
      ?w => 'bghjrqv',
      ?x => 'bcdefgjkpqsvwxz',
      ?y => 'chwxy',
      ?z => 's'
    }
  }

  def get(rule, char) when rule in [:initial, :sequential] do
    MapSet.new(@blacklist[rule][char] || '')
  end

  def get(:final, char) do
    MapSet.union(get(:sequential, char), MapSet.new(@blacklist[:final][char] || ''))
  end
end
