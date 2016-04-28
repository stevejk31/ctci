# Given a directed graph, design an algorithm to find out whether there is a
# route between two nodes
def route_between_nodes_dfs(node, end_node, visited_nodes = [])
  return true if node == end_node
  route.push(node)
  children = node.children
  unique_children = []
  unique_children = filter_common(children, visited_nodes)
  visited_nodes.concat(unique_children)
  return false if unique_children.empty?
  unique_children.each do |child|
    route_between_nodes_dfs(child, end_node, children)
  end
end

def route_between_nodes_bfs(start_node, end_node)
  queue = [] #push shift
  queue.push(start_node.children)
  until queue.empty?
    current_node = queue.shift
    return true if current_node == end_node
    queue.concat(filter_common(current_node.children, queue))
  end
  false

end


def filter_common(new_array, old_array)
  new_el = Hash.new { |hash, key| hash[key] = 0 }
  result = []
  new_array.each do |el|
    new_el[el] += 1
  end
  old_array.each do |el|
    new_el[el] -= 1
  end
  new_el.each do |el, count|
    result.push(el) if count > 0
  end
  result
end
