# You are given two sorted arrays, A and B, where A has a large enough buffer at the
# end to hold B. Write a method to merge B into A in sorted order

def sorted_merge(array1, array2)
  idx = 0
  while idx < array1.length
    case array1[idx] <=> array2.first
    when -1
      idx +=1
    when 0
      idx +=1
    when 1
      array1.insert(idx, array2.shift)
    end
  end
  array1 = array1 + array2
end
