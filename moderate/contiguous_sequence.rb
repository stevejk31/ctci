# You are given an array integers (both positive and negative). Find the
# contiguous sequence with the largest sum.
#
# Example:
# Input: [2, -8, 3, -2, 4, -10]
# Output: 5 (i.e., [4,-2,4])

def contiguous_sequence(array)
  max_sum = array.first
  array.each_with_index do |num, idx|
    current_sum = num
    array[(idx+1)..-1].each do |num|
      current_sum += num
      max_sum = current_sum if current_sum > max_sum
    end
  end

  max_sum
end

def cont_seq_better(array)
  max_sum = array.first
  sum = array.first
  array[1..-1].each do |num|
    sum += num
    if max_sum < sum
      max_sum = sum
    elsif sum < 0
      sum = 0
    end
  end
  max_sum
end
