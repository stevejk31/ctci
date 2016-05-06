# Given a sorted (increasing order) array with unique integer elements, write an
# algorithm to create a binary search tree with minimal height.
require_relative 'node.rb'

def minimal_tree(array)
  mid_idx = array.length/2
  mid = array[mid_idx]
  less_array = array.take(mid_idx)
  less_node = nil
  less_node = minimal_tree(less_array) unless less_array.length == 0

  more_array = array.drop(mid_idx + 1)
  more_node = nil
  more_node = minimal_tree(more_array) unless more_array.length == 0

  mid_node = Node.new(mid)
  mid_node.insert(less_node) if less_node
  mid_node.insert(more_node) if more_node

  mid_node
end
