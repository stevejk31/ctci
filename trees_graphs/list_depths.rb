# Given a binary tree, design an algorithm which creates a linked list of all the nodes
# at each depth (e.g., if you have a tree with depth D, you'll have D linked lists)

class LinkedList
  def initialize(value)
    @head = Node.new(value)
    @tail = @head
  end

  def insert(value)
    new_node = Node.new(value)
    @tail.next = new_node
    @tail = new_node
  end

  def delete(node)
    if node == @tail
      @tail = @tail.prev
    end
    node.prev.next = nil
    node.prev = nil
  end


end

class Node
  attr_reader :value, :next
  attr_accessor :prev
  def initialize(value)
    @value = value
    @prev = nil
    @next = nil
  end

  def next=(node)
    node.prev = self if node.nil?
    @next = node
  end


end
