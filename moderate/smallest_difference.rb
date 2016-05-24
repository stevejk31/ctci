# Given two arrays of integers, compute the pair of values (one value in each
# array) with the smallest (non-negative) difference. Return the difference.

# Example:
# Input:
# a = [1,3,15,11,2]
# b = [23,127,235,19,8]
# Output: 3. That is, the pair (11,8).

def smallest_difference(array1, array2)
  smallest_diff = nil
  array1.each do |num1|
    array2.each do |num2|
      if smallest_diff
        smallest_diff = (num1-num2).abs if smallest_diff > (num1-num2).abs
      else
        smallest_diff = (num1-num2).abs
      end
    end
  end
  smallest_diff
end


def small_diff_opt(array1, array2)
  array1.sort!
  array2.sort!
  idx1 = 0
  idx2 = 0
  min_diff = (array1.first - array2.first).abs
  while idx1 < array1.length && idx2 < array2.length
    num1 = array1[idx1]
    num2 = array2[idx2]
    current_diff = (num1-num2).abs
    min_diff = current_diff if min_diff > current_diff
    if num1 < num2
      idx1 += 1
    else
      idx2 += 1
    end
  end
  min_diff
end
