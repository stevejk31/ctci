class StackMin
  def initialize()
    @stack = []
    @min = nil
  end

  def push(value)
    if @stack.length == 0
      @min = value
    elsif @min > value
      @min = value
    end

    @stack.push([value, @min])
  end

  def pop
    value = @stack.pop
    value[0]
  end

  def peak
    @stack.last[0]
  end

  def min
    @stack.last[1]
  end
end
