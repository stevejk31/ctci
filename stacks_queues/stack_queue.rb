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
    raise 'Empty Queue' if @de_stack.empty?
    @de_stack.pop
  end

  def flip
    until @en_stack.empty?
      @de_stack.push(@en_stack.pop)
    end
  end
end
