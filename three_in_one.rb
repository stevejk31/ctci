# descibe hwo you can use a single array to implement three stacks
class ThreeInOne
  def initialize(length_stack, number_stacks)
    @stack = Array.new(length_stack * number_stacks) {nil}
    @location = Array.new(number_stacks)
    number_stacks.times do |num|
      @location[num] = length_stack * num
    end
    @length = length_stack
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
  end

  def valid_stack?(stack)
    stack > 0 && stack <= @length
  end

  def empty?(stack)
    @location[stack-1] <= @length * (stack-1)
  end

  def max?(stack)
    @location[stack-1] >= @length * stack
  end
end
