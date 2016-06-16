# Given two arrays of integers, find a pair of values (one value from each array)
# that you can swap to give the two arrays the same sum.

# EXAMPLE:
# Input:
# array1 = [4,1,2,1,1,2]
# array2 = [3,6,3,3]
# Output: [1,3]

def sum_swap(array1, array2)
  sum1 = array1.inject {|sum, num| sum + num}
  sum2 = array2.inject {|sum, num| sum + num}
  return [] if sum1 == sum2
  return false unless (sum1 - sum2) % 2 == 0
  diff = (sum1 - sum2) / 2
  array2.sort!
  array1.each do |num|
    return [num, num - diff] if binary_search(array2, num - diff)
  end
  false
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
