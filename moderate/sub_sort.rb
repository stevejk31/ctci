# Given an array of integers, write a method to find indices m and n such that
# if you sorted elements m through n, the entire array would be sorted. Minimize
# n - m (that is, find the smallest such sequence)

# EXAMPLE:
# Input: [1,2,4,7,10,11,7,12,6,7,16,18,19]
# Output: (3,9)

def sub_sort(array)
  left_idx = sorted_left(array)
  right_idx = sorted_right(array)
  p [left_idx, right_idx]
  return [left_idx, right_idx] if left_idx == 0 && right_idx == (array.length - 1)
  p array
  left_idx = check_left(left_idx, array)
  right_idx = check_right(right_idx, array)
  [left_idx + 1, right_idx - 1]
end

def check_left(left_idx, array)
  until left_idx == 0 || array[left_idx] < array[left_idx+1..-1].min
    left_idx -= 1
  end
  left_idx
end

def check_right(right_idx, array)
  until right_idx == (array.length - 1) || array[right_idx] > array[0..right_idx-1].max
    right_idx += 1
  end
  right_idx
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
    p result
    return result if array[length - idx] < array[length - idx - 1]
    result = length - idx
  end
  length
end
