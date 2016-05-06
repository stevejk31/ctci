# T1 and T2 are two very large binary trees, with T1 much bigger than T2, Create an
# algorithm to determine if T2 is a subtree of T1.
def check_subtree(tree1, tree2)
  # due to the depth of T1 being much larger than T2 a BFS seems more logical
  bfs(tree1.head, tree2,head)
end

def bfs(head, node)
  queue = head.children
  #push shift
  until queue.empty?
    current_node = queue.shift
    return true if current_node == node && same_tree?(current_node, node)
    queue += current_node.children
  end
  false
end

def same_tree?(node1, node2)
  return false if node1 != node2
  return true if node1.nil? && node2.nil?
  same_tree?(node1.less, node2.less) && same_tree?(node1.more, node2.more)
end

# alternative solution is to stringify and compare
