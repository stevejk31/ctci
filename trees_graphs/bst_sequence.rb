# A binary search tree was created by traversing through an array from left to right
# and insterting each element. Given a binary search tree with distinct elements, print all possible
# array that could have led to this tree.


# given:
#   2
# 1   3
# return [2,1,3], [2,3,1]
require_relative 'node.rb'
# can do this recursively to build arrays based on lowest node.
def bst_sequence(node)
  result = []
  children_array = node.children.permutation.to_a
  children_array.map do |array|
    array.unshift(node)
  end
end

# merge 2 arrays while maintaining order
# [0,1] [a,b]
# [0,1,a,b], [0,a,1,b], [0,a,b,1], [a,0,1,b], [a,b,0,1], [a,0,b,1]
def weave_array(array1, array2)
  result = []
  idx1 = 0
  idx2 = 1
  while #some condition
    temp_array = []
    while idx1 < array1.length && idx2 < array2.length
      if
        temp_array.push(array1[idx1])
        idx1 += 1
      end
      if
        temp_array.push(array2[idx2])
        idx2 += 1
      end
    end
    while idx1 < array1.length
      temp_array.push(array1[idx1])
      idx1 += 1
    end
    while idx2 < array2.length
      temp_array.push(array1[idx2])
      idx2 += 1
    end
    result.push(temp_array)
  end
  result
end
