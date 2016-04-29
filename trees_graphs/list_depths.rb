# Given a binary tree, design an algorithm which creates a linked list of all the nodes
# at each depth (e.g., if you have a tree with depth D, you'll have D linked lists)
# will use array's instead of linked lists

def list_depth(head_node)
  arrays = []
  arrays.push([head_node])
  prev_queue = []
  prev_queue.concat(head_node.children)
  until prev_queue.empty?
    next_queue = []
    pre_queue.each do |node|
      next_queue.concat(node.children)
    end
    arrays.push(next_queue)
    pre_queue = next_queue

  end
  arrays
end



# class LinkedList
#   def initialize(value)
#     @head = Node.new(value)
#     @tail = @head
#   end
#
#   def insert(value)
#     new_node = Node.new(value)
#     @tail.next = new_node
#     @tail = new_node
#   end
#
#   def delete(node)
#     if node == @tail
#       @tail = @tail.prev
#     end
#     node.prev.next = nil
#     node.prev = nil
#   end
#
#
# end
#
# class Node
#   attr_reader :value, :next
#   attr_accessor :prev
#   def initialize(value)
#     @value = value
#     @prev = nil
#     @next = nil
#   end
#
#   def next=(node)
#     node.prev = self if node.nil?
#     @next = node
#   end
#
#
# end
