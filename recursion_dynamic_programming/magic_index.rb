# A magic index in an array A[0...n-1] is defined to be an index such that A[i] =
# i. Given a sorted array of distinct integers, write a method to find a magic index, if one exists, in
# array A.

# brute force solution

def magic_index_brute_force(array)
  array.each_with_index do |el, idx|
    return idx if el == idx
  end
end
# [0, 1, 2, 3, 4, 5, 6, 7]
# [-1,0, 1, 2, 3, 4, 7, 8]
# [-1,0, 2, 4, 6, 8,10,12]
def magic_index(array, idx = array.length/2, window = idx)
  return nil if window == 0
  case array[idx] <=> idx
  when 1
    magic_index(array, idx - window/2, window/2)
  when 0
    return idx
  when -1
    magic_index(array, idx + window/2, window/2)
  end
end

# Follow Up
# What if the values are not distinct?
# [0, 1, 2, 3, 4, 5, 6, 7]
# [1, 1, 1, 2, 3, 4, 7, 8]
# [-1,0, 2, 4, 5, 6, 6, 6]
def magic_index_indistinct(array, idx = array.length/2, window = idx)
  return nil if window == 0
  return idx if array[idx] == idx
  lower_idx = idx-window
  lower_val = array[lower_idx]
  center_val = array[idx]
  higher_idx = idx+window-1
  higher_val = array[higher_idx]
  if (lower_val <= idx && lower_val >= lower_idx ) ||
    (center_val <= idx && center_val >= lower_idx ) ||
    (lower_val <= idx && center_val >= idx ) ||
    (lower_val <= lower_idx && center_val >= lower_idx )
    result =  magic_index_indistinct(array, idx - window/2, window/2)
    return result if result
  end
  if (higher_val >= idx && higher_val <= higher_idx ) ||
    (center_val <= higher_idx && center_val >= idx ) ||
    (center_val <= idx && higher_val >= idx ) ||
    (center_val <= higher_idx && higher_val >= higher_idx )
    result = magic_index_indistinct(array, idx + window/2, window/2)
    return result if result
  end
end
