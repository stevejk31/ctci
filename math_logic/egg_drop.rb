# There is a building of 100 floors. If an egg drops from the Nth floor or
# above, it will break. If it's dropped from any floor below, it will not break. You're given 2 eggs. Find
# N, while minimizing the number of drops for the worst case.
breaking_point = 0
count_drops = 0

def drop(floor, breaking_point)
  floor >= breaking_point
end

def find_breaking_point(breaking_point = 100, number_floors=100)
  interval = ((1 + (1+4*number_floors)**(0.5))/2).to_i
  previous_floor = 0
  number_drops = 0
  egg1 = 0
  egg1_broken = false
  egg2_broken = false
  until egg1_broken
    previous_floor = egg1
    egg1 += interval
    number_drops += 1
    egg1_broken = drop(egg1, breaking_point)
  end
    egg2 = previous_floor
  until egg2_broken
    egg2 += 1
    number_drops +=1
    egg2_broken = drop(egg2, breaking_point)
  end
  number_drops
end
