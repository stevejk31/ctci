# Given two arrays of integers, find a pair of values (one value from each array)
# that you can swap to give the two arrays the same sum.

# EXAMPLE:
# Input: [4,1,2,1,1,2] [3,6,3,3]
# Output: [1,3]

def sum_swap(array1, array2)
  array1.sort!
  array2.sort!
  sum1 = array1.inject {|sum, num| sum + num}
  sum2 = array2.inject {|sum, num| sum + num}
  diff = (sum1 - sum2).abs / 2
  return [] if sum1 == sum2
  return false unless (sum1 - sum2) % 2 == 0

end
