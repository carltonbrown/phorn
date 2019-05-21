defmodule Profile do
  import ExProf.Macro

  def go do
    profile do
      count = 250_000
      inspect_every = 1000
      Phorn.bulk_gen(9, count, [], inspect_every)
    end
  end 
end
