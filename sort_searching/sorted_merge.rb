# You are given two sorted arrays, A and B, where A has a large enough buffer at the
# end to hold B. Write a method to merge B into A in sorted order

def sorted_merge(array1, array2)
  idx = 0
  desired_length = array1.length + array2.length
  until array2.empty?
    case array1[idx] <=> array2.first
    when -1
      idx +=1
    when 0
      idx +=1
    when 1
      array1.insert(idx, array2.shift)
      idx += 1
    end
  end
  array1
end

#b/c insertions are expensive
def sorted_merge_better(array1, array2)
  last_idx = array1.length + array2.length - 1
  idx1 = array1.length - 1
  until array2.empty?
    if array1[idx1].nil? || array2.last >= array1[idx1]
      array1[last_idx] = array2.pop
      else
      array1[last_idx], array1[idx1] = array1[idx1], array1[last_idx]
      idx1 -= 1
    end

    last_idx -= 1
  end

  # if idx1 < 0
  #   until last_idx <= 0
  #     array1[last_idx] = array2.pop
  #     last_idx -= 1
  #   end
  # end

  array1
end
