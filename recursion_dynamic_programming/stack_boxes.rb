# You have a stack of n boxes, with widths wi, heights hi, and hepths di. The boxes
# cannont be rotated and can only be stacked on top of one another if each box in the sack is strictly
# larger than the box above it in width, height, and depth. Implement a method to compute the
# height of the tallest possible stack. The height of a stack is the sum of the heights of each box.

# boxes = [[w1,h1,d1], [w2,h2,d2], [w3,h3,d3]]
def stack_boxes(boxes, stack = [])
  return 0 if boxes.length == 0
  boxes = sort_boxes_height(boxes)
  max_height = calculate_height(stack)
  current_boxes = remove_min!(boxes)
  temp_max_height = stack_boxes(boxes, stack)
  if temp_max_height > max_height
    max_height = temp_max_height
  end
  until current_boxes.empty?
    temp_stack = stack.clone
    current_box = current_boxes.shift
    if compare_width_depth(stack.last, current_box)
      temp_stack.push(current_box)
      temp_max_height = stack_boxes(boxes, temp_stack)
      if temp_max_height > max_height
        max_height = temp_max_height
      end
    end
  end
  max_height
end

def compare_width_depth(prev_box, new_box)
  return prev_box if new_box.nil?
  prev_box.width < new_box.width && prev_box.depth < new_box.depth
end

def sort_boxes_height(boxes)
  boxes.sort { |a, b| a.height <=> b.height }
end

def remove_min!(boxes)
  p boxes
  height = boxes[0].height
  result = []
  until boxes[0].height != height
    result.push(boxes.shift)
  end
  result
end

def calculate_height(stack)
  sum = 0
  stack.each {|box| sum += box.height }
  sum
end

class Box
  attr_accessor :width, :height, :depth
  def initialize(width, height, depth)
    @width = width
    @height = height
    @depth = depth
  end

  def inspect
    p [@width, @height, @depth]
  end
end


def make_boxes
  boxes = []
  10.times do
    width = rand(10)+1
    height = rand(10)+1
    depth = rand(10)+1
    boxes.push(Box.new(width, height, depth))
  end
  boxes
end
