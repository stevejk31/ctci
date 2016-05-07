# A magic index in an array A[0...n-1] is defined to be an index such that A[i] =
# i. Given a sorted array of distinct integers, write a method to find a magic index, if one exists, in
# array A.
#
# Follow Up
# What if the values are not distinct?

# brute force solution

def magic_index_brute_force(array)
  array.each_with_index do |el, idx|
    return idx if el == idx
  end
end
# [0, 1, 2, 3, 4, 5, 6, 7]
# [-1,0, 1, 2, 3, 4, 6, 7]
# [-1,0, 2, 4, 6, 8,10,12]
def magic_index(array, idx = array.length/2, window = idx)
  return none if window == 0
  case array[idx] <=> idx
  when 1
    magic_index(array, idx - window/2, window/2)
  when 0
    return idx
  when -1
    magic_index(array, idx + window/2, window/2)
  end
end
