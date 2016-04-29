# Write an algorithmto find the "next" node (i.e., in-order successor) of a given node in a
# binary search tree. You may assume that each node has a link to its parent

# [2,5,7,9,10,12,16,13]
#      12
#    /   \
#   9    16
#  /\    /
# 5 10  13
# /\
#2 7

# left most on right side of tree or least value based on parents
def successor(node)
  min_parent = min_value_root(node.parent, node.value)
  left_most = left_most(node.more)
  if min_parent
    min_parent.value < left_most.parent ? min_parent : left_most
  else
    left_most
  end
end

def left_most(node)
  return node if node.less.nil?
  left_most(node.less)
end

def min_value_root(node, min, max = nil)
  if node.value > min
    if max.nil?
      max = node
    elsif max.value > node.value
      max = node
    end
  end

  return max if node.parent.nil?

  min_value_root(node.parent, min, max)
end
