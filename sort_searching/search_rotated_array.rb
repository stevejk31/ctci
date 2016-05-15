# Given a soted array of n integeers that ahs been rotated an unknown number of times,
# write code to find an element in the array. You may assum that the array was
# orignally sorted increasing order

# EXAMPLE
# Input [15, 16, 19, 20, 25, 1, 4, 5, 7, 10, 14]
# Output: 8 (index of 5 in array)


def search_rotated_array(array, target)
  return nil if array.length == 0
  mid_idx = array.length/2
  mid_value = array[mid_idx]
  left_array = array.take(mid_idx)
  right_array = array.drop(mid_idx+1)
  return mid_idx if mid_value == target
  left = search(left_array, target)
  return left if left
  right = search(right_array, target)
  return right + 1 + mid_idx if right
end


def search(array, target)
  return nil if array.length == 0
  # check if sorted
  if array.first < array.last
    if array.first <= target && array.last >= target
      binary_search(array, target)
    else
      nil
    end
    #check if rotated
  else
    search_rotated_array(array, target)
  end
end

def binary_search(array, target)
  return nil if array.length == 0
  mid_idx = array.length/2
  mid_value = array[mid_idx]
  left_array = array.take(mid_idx)
  right_array = array.drop(mid_idx+1)
  if target < mid_value
    binary_search(left_array, target)
  elsif target == mid_value
    mid_idx
  else
    right = binary_search(right_array, target)
    mid_idx + 1 + right if right
  end
end
