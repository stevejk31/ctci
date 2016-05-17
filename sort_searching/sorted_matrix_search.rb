# Given an M x N matrix in which each row and each column is sorted in ascending
# order, write a method to find an element.

require_relative 'binary_search.rb'
# not a valid solutions 
def sorted_matrix_search(matrix, target, mid_idx = matrix.length/2)
  return nil if matrix.empty?
  return binary_search(matrix[0], target) if matrix.length == 1
  mid_array = matrix[mid_idx]
  left_matrix = matrix.take(mid_idx)
  right_matrix = matrix.drop(mid_idx+1)
  case between(mid_array, target)
  when -1
    sorted_matrix_search(left_matrix, target)
  when 0
    mid = binary_search(mid_array, target)
    return [mid_idx, mid] if mid
    left = sorted_matrix_search(left_matrix, target)
    return left if left
    right = sorted_matrix_search(right_matrix, target)
    return right if right
  when 1
    sorted_matrix_search(right_matrix, target)
  end

end

def between(matrix, target)
  if matrix.first < target && matrix.last > target
    return 0
  elsif matrix.first > target
    return -1
  elsif matrix.last < target
    return 1
  end
end
