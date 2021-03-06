# You are given a list of projects and al ist of dependecies (which is a list of pairs of
# projects, where the first project is dependent on the second project). All of a project's dependencies
# must be built before the project is. Find a build order that will allow the projects to be built. If there
# is no valid build order, return an error.

# EXAMPLE
# Input:
#   projects: a,b,c,d,e,f
#   dependencies (d,a), (b,f), (d,b), (a,f), (c,d)
# Output: f, e, a, b, d, c
# abcdef
# abcefd
# acefdb
# acefbd
# cefbda -> cefbad
# efbadc
# O(num_dependencies!)
# (a,f), (b,f), (c,d), (d,a), (d,b)
# (d,a), (d,b), (c,d), (a,f), (b,f)
# A children: D
# B children: D
# C children:
# D children: C
# E children:
# F children: B
# 1 look for nodes without children
# 2 look for nodes with built children until no nodes viable
# f,a,b,d,e,c,

def dependencies(projects, dependencies)
  project_hash = {}
  build_order = []
  projects.each do |project|
    project_hash[project] = Node.new(project)
  end
  dependencies.each do |dependency|
    project_hash[dependency[1]].children.push(dependecy[0])
  end
  queue = []
  # built queue with nodes w/o children
  queue.concat(nodes_without_dependency(projects_hash))

  until queue.empty?
    build_order.push(queue.shift)
    queue.concat(projects_hash, [build_order.last])
    # build nodes w/o children && remove children from built nodes

  end

  projects_hash ? false : build_order  

end

def nodes_without_dependency(projects_hash, comp = [])
  queue = []
  project_hash.each do |project, node|
    if node.children == comp
      queue.push(project)
      projects_hash.delete(project)
    end
  end
  queue
end

class Node
  attr_accessor :children
  attr_reader :value
  def initialize(value)
    @value = value
    @children = []
  end

end
