# In the classic problem of the Towers of Hanoi, you have 3 towers and N disks of
# different sizes which can slide onto any tower. The puzzle starts with disks sorted in ascending order
# of size from top to bottom. You have the following contraints:
# (1) Only one disk can be moved at a time.
# (2) A disk is slid off the top of one tower onto the next tower.
# (3) A disk can only be placed on top of a larger disk
# Write a program to move the disks from the first tower to the last using stacks

# [[3,2,1],[],[]] => [[],[3,2,1],[]] OR [[],[],[3,2,1]]
# def hanoi_solver(disks)
#   start_pos = 0
#   end_pos = 1
#   other_pos = 2
#   until disks[0].empty?
#     hanoi_solver_helper(disks, start_pos, end_pos, other_pos)
#     move(disks, 0, other_pos) unless disks[0].empty?
#     start_pos, end_pos, other_pos = end_pos, other_pos, start_pos
#   end
#   hanoi_solver_helper(disks, start_pos, end_pos, other_pos)
#
# end
#
# def hanoi_solver_helper(disks, start_pos, end_pos, other_pos)
#   p [start_pos, other_pos, end_pos]
#   # start -> end
#   move(disks, start_pos, end_pos)
#   p disks
#   # start -> mid
#   move(disks, start_pos, other_pos)
#   p disks
#   # end -> mid
#   move(disks, end_pos, other_pos)
#   p disks
#   # start -> end
#   move(disks, start_pos, end_pos)
#   p disks
#   # mid -> start
#   move(disks, other_pos, start_pos)
#   p disks
#   # mid -> end
#   move(disks, other_pos, end_pos)
#   p disks
#   # start -> end
#   move(disks, start_pos, end_pos)
#   p disks
#
# end

def solve_hanoi(disks, origin, dest, buffer, n = disks[0].length)
  return disks if n <= 0
  solve_hanoi(disks, origin, buffer, dest, n-1)
  move(disks, origin, dest)
  solve_hanoi(disks, buffer, dest, origin, n-1)

end

def move(disks, remove_idx, add_idx)
  raise "empty" if disks[remove_idx].empty?
  disks[add_idx].push(disks[remove_idx].pop)
end

def hanoi_solved?(disks)
  num_empty = 0
  disks[0].empty? && (disks[1].empty? || disks[2].empty?)
end
