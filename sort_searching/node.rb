#this is a binary node
class Node
  attr_reader :value, :more, :less
  attr_accessor :parent

  def initialize(value)
    @value = value
    @parent = nil
    @less = nil
    @more = nil
  end

  def insert(node)
    case node.value <=> @value
    when -1
      if @less
        @less.insert(node)
      else
        self.less=node
      end
    when 1
      if @more
        @more.insert(node)
      else
        self.more=node
      end
    when 0
      if @more
        @more.insert(node)
      else
        self.more=node
      end
    end
  end

  def less=(node)
    @less = node
    node.parent = self unless node.nil?
  end

  def more=(node)
    @more = node
    node.parent = self  unless node.nil?
  end

  def children
    if @less && @more
      [@less, @more]
    elsif @less
      [@less]
    elsif @more
      [@more]
    else
      []
    end
  end
end
