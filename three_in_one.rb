# descibe hwo you can use a single array to implement three stacks
class ThreeInOne
  def initialize(length_stack, number_stacks)
    @length = length_stack
    @num_stacks = number_stacks
    @stack = Array.new(@length * @num_stacks) {nil}
    @location = Array.new(number_stacks)
    @num_stacks.times do |num|
      @location[num] = length_stack * num
    end
  end
# 1st 2nd 3rd stack
  def push(stack, value)
    raise "Not a Valid Stack" unless valid_stack?(stack)
    raise "Max Stack" if max?(stack)
    @stack[@location[stack-1]] = value
    @location[stack-1] +=1
  end

  def pop(stack)
    raise "Not a Valid Stack" unless valid_stack?(stack)
    raise "No Output" if empty?(stack)
    @location[stack-1] -=1
    @stack[@location[stack-1]]
  end

  def peak(stack)
    raise "Not a Valid Stack" unless valid_stack?(stack)
    raise "No Output" if empty?(stack)
    @stack[@location[stack-1]-1]
  end

  def resize
    @length = @length * max
    new_stack = Array.new(@length * @num_stacks) {nil}
    #TODO resize
  end

  def valid_stack?(stack)
    stack > 0 && stack <= @num_stacks
  end

  def empty?(stack)
    @location[stack-1] <= @length * (stack-1)
  end

  def max?(stack)
    @location[stack-1] >= @length * stack
  end
end
