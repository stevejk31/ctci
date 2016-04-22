# descibe hwo you can use a single array to implement three stacks
class ThreeInOne
  attr_reader :stack, :location, :length
  def initialize(length, count)
    @stack = Array.new(length * count) {nil}
    @location = Array.new(count)
    count.times do |num|
      @location[num] = length * num
    end
    @length = length
  end
# 1st 2nd 3rd stack
  def push(stack, value)
    #valid stack
    raise "Max Stack" if max?(stack)
    @stack[@location[stack-1]] = value
    @location[stack-1] +=1
  end

  def pop(stack)

  end

  def peak(stack)

  end

  def max?(stack)
    require 'byebug'; debugger
    @location[stack-1] >= @length * stack
  end
end
