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

# next node must be right node or parent
def successor(node)
  if node.more && node.more.value < node.parent.value
    node.more
  else
    node.parent
  end
end
