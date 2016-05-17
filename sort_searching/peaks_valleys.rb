# In an array of intergers, a "peak" is an element which is greater than or equal
# to the adjacent integers and a "calley" is an element which is less than or
# equal to the adjacent integers. For example, in the array [5,8,6,2,3,4,6], [8,6]
# are peaks and [5,2] are valleys. Given an array of integers, sort the array
# into an alternating sequence of peaks and valleys

# EXAMPLE
# Input: [5,3,1,2,3]
# Output: [5,1,3,2,3]

def peaks_valleys(array)
  sorted_array = array.sort
  last_idx = array.length-1
  idx = 0
  result = []
  while idx < last_idx
    result.push(sorted_array[last_idx])
    result.push(sorted_array[idx])
    idx += 1
    last_idx -= 1
  end

  result
end


def sort_valley_peak(array)
  idx = 1
  while idx < array.length-1
    biggest_idx = max_index(array, idx-1, idx, idx + 1)
    idx += 2
    if idx != biggest_idx
      swap(array, idx, biggest_idx)
    end
  end
  array
end

def swap(array, idx, idx2)
  array[idx], array[idx2] = array[idx2], array[idx]
end

def max_index(array, idx1, idx2, idx3)
  max_num = [array[idx1], array[idx2], array[idx3]].max
  return idx1 if max_num == array[idx1]
  return idx2 if max_num == array[idx2]
  return idx2 if max_num == array[idx3]
end
