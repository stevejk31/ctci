# Given a sorted array of strings that is interspersed with empty strings,
# write a method to find the location of a given string.
#
# EXAMPLE:
# Input: ball, ["at", "", "", "", "ball", "", "", "car", "", "", "dad", "", ""]
# Output: 4

def sparse_search(array, target)
  return nil if array.length == 0
  mid_idx = array.length/2
  left_array = array.take(mid_idx)
  right_array = array.drop(mid_idx)
  compare = compare_right(right_array, target)
  # could compare left and right first terms to speed up the nil case
  if compare == "left" || compare.nil?
    left = sparse_search(left_array, target)
    left if left
  elsif compare == "right"
    right = sparse_search(right_array, target)
    mid_idx + right if right
  else
    mid_idx + compare
  end
end


def compare_right(array, target)
  array.each_with_index do |word, idx|
    if word != ""
      case target <=> word
      when -1
        return "left"
      when 0
        return idx
      when 1
        return "right"
      end
    end
  end
  nil
end
