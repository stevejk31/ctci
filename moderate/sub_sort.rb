# Given an array of integers, write a method to find indices m and n such that
# if you sorted elements m through n, the entire array would be sorted. Minimize
# n - m (that is, find the smallest such sequence)

# EXAMPLE:
# Input: [1,2,4,7,10,11,7,12,6,7,16,18,19]
# Output: (3,9)

def sub_sort(array)
  left_idx = sorted_left(array)
  right_idx = sorted_right(array)
  p array
  loop do
    left_array = array[0..left_idx]
    middle_array = array[(left_idx + 1)..(right_idx - 1)]
    right_array = array[right_idx..-1]
    puts "left"
    p left_array
    puts "middle"
    p middle_array
    puts "right"
    p right_array
    if (left_array.last.nil? || left_array.last <= middle_array.min) &&
      (right_array.first.nil? || right_array.first >= middle_array.max)
      break
    end
    left_idx -= 1 if left_array.last.nil? || left_array.last > middle_array.min
    right_idx += 1 if right_array.first.nil? || right_array.first < middle_array.max
  end
  [left_idx+1, right_idx-1]
end

def sorted_left(array)
  result = 0
  (array.length-1).times do |idx|
    return result if array[idx+1] < array[idx]
    result = idx + 1
  end
  0
end


def sorted_right(array)
  length = array.length - 1
  result = length
  (length).times do |idx|
    return result if array[length - idx] < array[length - idx - 1]
    result = length - idx
  end
  result
end
