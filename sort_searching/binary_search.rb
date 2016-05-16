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
