# Given a directed graph, design an algorithm to find out whether there is a
# route between two nodes
def route_between_nodes_dfs(node, end_node, route = [])
  return false if node == nil
  route.push(node)
  children = node.children
  children.each do |child|
    return route if child == end_node
    route_between_nodes_dfs(child, end_node, route)
  end
end

def route_between_nodes_bfs(start_node, end_node)
  
end
