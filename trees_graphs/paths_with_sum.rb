# You are given a binary tree in which each node contains an integer value (which
# might be positive or negative). Design an algorithm to count the number of paths that sum to a
# given value. The path does not need to start or end at the root or a leaf, but it must go downwards
# (traveling only from parent nodes to child nodes)

# dfs search for suming to total
# sums = 8
#                10
#         1       3
#   2             5
# 2       4       4
#   1             3
#         2       1
# 2-2-1-10
# 2-2-1-3
# 2-2-4-5
# 2-2-4-4
# 2-1-2-3
# 2-1-2-1

def paths_with_sum(head_node, value, array_values = [], num_sums = 0)
  num_sums = check_sum(array_values, target) if head_node.children.empty?

end

#given an array of values return how many target sums
def check_sum(array, target)

end
