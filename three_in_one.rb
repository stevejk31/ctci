# descibe hwo you can use a single array to implement three stacks
class ThreeInOne
  def initialize(size, count)
    @stack = Array.new(size * count) {nil}
    @location = Array.new(count)
    count.times do |num|
      @location[num] = size * num
    end
  end

  def push(stack)
    
  end

  def pop(stack)

  end

  def peak(stack)

  end
end
