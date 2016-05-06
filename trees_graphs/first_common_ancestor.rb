# Design an algorithm and write code to find the first common ancestor
# of two nodes in a binary tree. Avoid storing additional nodes in a data structure. NOTE: This is not
# necessarily a binary search tree

# a = (0..10).to_a.shuffle
# blah = Node.new(a.pop)
# a.each do |num|
#   blah.insert(Node.new(num))
# end

# [2,5,7,9,10,12,16,13]
#      12
#    /   \
#   9    16
#  /\    /
# 5 10  13
# /\
#2 7

require_relative 'node.rb'
# if we mark visited nodes it'll increase speed substantially
# bad solution if we dont' store nodes.
def first_common_ancestor(node1, node2)
  return nil if node1.nil?
  search_node = node1
  #search for node2 as a child of node1
  if node2 == dfs(search_node, node2)
    return search_node
  else
    #search based on each parent
    first_common_ancestor(search_node.parent, node2)
  end
end
# dfs is based on depth
def dfs(node, target)
  return node if node == target
  node.children.each do |child|
    result = dfs(child, target)
    return result if !!result
  end
  nil
end
