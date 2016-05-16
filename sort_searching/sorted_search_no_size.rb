# You given an array-like data structure Listy which lacks a size
# method. It does, however, have an element_at(i) method that returns the element at index i in
# O(1) time. If i is beyond the bounds of the data structure, it returns -1. (For this reason, the data
# structure only supports positive integers.) Given a Listy which contains sorted, positive integers,
# find the index at which an element x occurs. If x occurs multiple times, you may return any index.

def sort_search_no_size(list, target)
  idx = 0
  increment = 2
  until list[idx] == -1 || list[idx] == nil || list[idx] >= target
    p [idx, list[idx]]
    idx += increment
    increment *= 2
  end
  p [idx, list[idx]]

  if list[idx] == nil || list[idx] == -1
    while list[idx] == nil || list[idx] == -1
      idx -= 1
    end
    binary_search(list.take(idx + 1), target)
  elsif list[idx] > target
    binary_search(list.take(idx), target)
  elsif list[idx] == target
    idx
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
