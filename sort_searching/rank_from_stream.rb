# Imagine you are reading in a stream of intergers. Periodically, you wish to be
# able to look up the rank of a number x (the number of values less than or equal
# to x). Implement the data structures and algorithms to support these operations.
# That is, implement the method track(int x), which is called when each number is
# generated, and the method getRankOfNumer(int x), which returns the number of
# values less than or equal to x (not including x itself)
require_relative 'node.rb'


# EXAMPLE:
# stream = [5, 1, 4, 4, 5, 9, 7, 13, 3]
# get_rank_of_number(1) = 0
# get_rank_of_number(3) = 1
# get_rank_of_number(4) = 3

class WatchStream
  attr_reader :head
  def initialize
    @head = nil
  end
  def track(number)
    if @head.nil?
      @head = Node.new(number)
    else
      @head.insert(Node.new(number))
    end
  end

  def get_rank_of_number(number)
    node = dfs_search(@head, number)
    count = 0
    if node
      count = count_less_nodes(node)
    end
  end

  def dfs_search(node, target)
    return node if node.value == target
    if target > node.value
      return dfs_search(node.more, target)
    elsif target < node.value
      return dfs_search(node.less, target)
    end
    nil
  end

  def count_less_nodes(node)
    count = 0
    queue = []
    queue += compare_nodes(@head, node)
    until queue.empty?
      temp_node = queue.shift
      count += 1 if temp_node != node
      queue += compare_nodes(temp_node, node)
    end
    count

  end

  def compare_nodes(head, target)
    queue = []
    head.children.each {|child| queue.push(child) if child.value <= target.value}
    queue
  end
end
