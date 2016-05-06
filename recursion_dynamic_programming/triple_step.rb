# A child is running up a staircase with n steps and can hop either 1 step, 2 steps, or 3
# steps at a time. Implement a method to count how many possible ways the child can run up the
# stairs.

def ways_up_stairs(number_stairs, cache = {3 => 4,  2 => 2,  1 => 1})
  ways = cache[number_stairs]
  if ways
    ways
  else
    ways = 0
    ways += ways_up_stairs(number_stairs - 3, cache) + 1
    ways += ways_up_stairs(number_stairs - 2, cache) + 1
    ways += ways_up_stairs(number_stairs - 1, cache) + 1
    cache[number_stairs] = ways
  end
end
