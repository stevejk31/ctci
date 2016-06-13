# You have an integer matrix representing a plot of land, where the value at that
# location represents the height above sea level. A value of zero indicates water.
# A pond is a region of water connected vertically, horizontally, or diagonally.
# The size of the pond is the total number of connected water cells. Write a
# method to compute the sizes of all ponds in the matrix.

# EXAMPLE:
# Input:
# [
#   [0,2,1,0],
#   [0,1,0,1],
#   [1,1,0,1],
#   [0,1,0,1]
# ]
#
# Output 2, 4, 1 in any order

def pond_size(matrix)
  ponds = []
  found = Hash.new { |hash, key| hash[key] = false }
  matrix.each do |array|
    array.each do |el|

    end
  end

  ponds
end

def pond(initial, matrix)
  row, col = initial
  return 0 if matrix[row][col] != 0
  above = pond([row-1, col], matrix)
  below = pond([row+1, col], matrix)
  left = pond([row, col-1], matrix)
  right = pond(row, col+1], matrix)


end

def in_bounds?(pos, matrix)


end
