# You are implementing a binary tree class from scratch which, in addition to
# insert, find, and delte has a method getRandomNode() which returns a random node
# from the tree. All nodes should be equally likely to be chosen. Design and implement an algorithm
# for getRandomNode, and explain how you would implement the rest of the methods.
require_relative 'node.rb'

class BinaryTree
  def initialize()
    @head = nil
    @number_nodes = 0
  end
  def insert(value)
    new_node = Node.new(value)
    if @head
      @head.insert(new_node)
    else
      @head = new_node
    end
    @number_nodes += 1
    new_node
  end

  def find(value)

  end

  def get_random_node
    # number each node
    # generate random number
    # binary search for that number nods
  end

end


class Node
  def delete
    if node.children.empty?
      if @parent.left == self
        @parent.less = nil
      elsif @parent.right == self
        @parent.more = nil
      end
    else
      self.swap_down.delete
      # tons of problem when swapping

    end
  end



end
