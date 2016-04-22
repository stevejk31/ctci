# descibe hwo you can use a single array to implement three stacks
class ThreeInOne
  def initialize(length, count)
    @stack = Array.new(size * count) {nil}
    @location = Array.new(count)
    count.times do |num|
      @location[num] = size * num
    end
    @length = length
  end

  def push(stack, value)
    @stack[@location[stack-1]] = value
  end

  def pop(stack)

  end

  def peak(stack)

  end

  def max?(stack)
    
  end
end
