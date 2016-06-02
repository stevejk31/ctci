# You are building a diving board by placing a bunch of planks of wood end-to-end.
# There are two types of planks, one of length shorter and one of length longer.
# You must use exactly K planks of wood. Write a method to generate all possible
# lengths for the diving board.

def diving_board(planks, num_planks)
  shorter = []
  longer = []
  planks.each do |plank|
    if plank.length == :longer
      longer.push(plank)
    else
      shorter.push(shorter)
    end
  end
  result = []
  longer_planks = longer.length
  shorter_planks = 0
  until longer_planks < 0 || shorter_planks > shorter.length
    result.push([longer_planks, shorter_planks])
    longer_planks -= 1
    shorter_planks -= 1
  end
  result
end


class Plank
  attr_reader :length
  # length :longer or :shorter
  def initialize(length)
    @length = length
  end

end

planks = []
10.times do
  if rand(2) == 1
    planks.push(Plank.new(:longer))
  else
    planks.push(Plank.new(:shorter))
  end
end
