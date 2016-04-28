# Given a sorted (increasing order) array with unique integer elements, write an
# algorithm to create a binary search tree with minimal height.

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

class Node
  attr_reader :value, :more, :less
  attr_accessor :parent

  def initialize(value)
    @value = value
    @parent = nil
    @less = nil
    @more = nil
  end

  def insert(node)
    case node.value <=> @value
    when -1
      if @less
        @less.insert(node)
      else
        self.less=node
      end
    when 1
      if @more
        @more.insert(node)
      else
        self.more=node
      end
    when 0
      if @more
        @more.insert(node)
      else
        self.more=node
      end
    end
  end

  def less=(node)
    @less = node
    node.parent = self unless node.nil?
  end

  def more=(node)
    @more = node
    node.parent = self  unless node.nil?
  end
end
