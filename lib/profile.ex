defmodule Profile do
  import ExProf.Macro

  def go do
    profile do
      count = 10000
      inspect_every = 100
      phorns = Phorn.bulk_gen(9, count, MapSet.new([]), inspect_every)
    end
  end 
end
