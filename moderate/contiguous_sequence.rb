# You are given an array integers (both positive and negative). Find the
# contiguous sequence with the largest sum.
#
# Example:
# Input: [2, -8, 3, -2, 4, -10]
# Output: 5 (i.e., [4,-2,4])

def contiguous_sequence(array)
  sum_max = array.first
  array.each_with_index do |num, idx|
    current_sum = num
    array[(idx+1)..-1].each do |num|
      current_sum += num
      sum_max = current_sum if current_sum > sum_max
    end
  end
  
  sum_max
end
