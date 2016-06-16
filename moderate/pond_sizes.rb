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
# a = [[0,2,1,0],[0,1,0,1],[1,1,0,1],[0,1,0,1]]
# Output 2, 4, 1 in any order

def pond_size(matrix)
  ponds = []
  found = Hash.new { |hash, key| hash[key] = false }
  matrix.each_with_index do |array, row|
    array.each_index do |col|
      count = pond([row,col], matrix)
      ponds.push(count) if count > 0
    end
  end

  ponds
end

def pond(initial, matrix)
  row, col = initial
  return 0 unless !!matrix[row] && !!matrix[row][col] && in_bounds?(initial, matrix)
  return 0 if matrix[row][col] != 0
  matrix[row][col] = nil
  count = 0
  (row-1..row+1).each do |cur_row|
    (col-1..col+1).each do |cur_col|
      count+= pond([cur_row,cur_col],matrix)
    end
  end
  count + 1
end

def in_bounds?(pos, matrix)
  row, col = pos
  !!row && !!col && row < matrix.length && col < matrix[0].length && row >= 0 && col >= 0

end
