# Implement a queue using two stacks
class StackQueue
  def initialize
    # two hypothetical stack only using push and pop
    @en_stack = []
    @de_stack = []
  end

  def enqueue(value)
    @en_stack.push(value)
  end

  def dequeue
    flip if @de_stack.empty?

  end

  def flip
  end
end
