# Imagine a stack of plates if the stack gets too high, it might topple.
# Therefore in real life, we woudl likely start a new stack when the previous stack exceeds some
# threshold. Implement a data structure SetOfStacks that mimics this. SetOfStacks should be
# composed of several stacks and should create a new stack once the previous one exceeds capacity.
# SetOfStacks.push() and SetOfStacks.pop() should behave identically to a single stack
# (that is, pop() should return the same values as it would if there were just a single stack).
# Implement a function popAt(int index) which performs a pop operation on a specific sub-stack).

class SetOfStacks
  attr_accessor :set_stacks, :current_index, :max_size
  def initialize(size)
    @max_size = size
    @current_stack = []
    @set_stacks = []
  end

  def push(value)
    resize_up! if @current_stack.length >= @max_size
    @current_stack.push(value)
    value
  end

  def pop
    resize_down! if @current_stack.length == 0
    @current_stack.pop
  end

  def pop_at(stack = input - 1)
    raise "This Stack is Empty" if @set_stacks[stack].empty?
    @set_stacks[stack].pop
  end

  def resize_up!
    @set_stacks.push(@current_stack)
    @current_stack = []
  end

  def resize_down!
    raise "Stack is Empty" if @set_stacks.empty?
    while @current_stack.empty?
      @current_stack = @set_stacks.pop
    end
  end
end
