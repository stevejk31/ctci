# Given two squares on a two-dimensional plane, find a line that would cut these
# two squares in half. Assume that the top and the bottom sides of the square run
# parallel to the x-axis.

def bisect_square(square1, square2)
  center1 = center_square(square1)
  center2 = center_square(square2)
  line_function(center1, center2)
end
# returns slope, intercept

def center_square(square)
  pt1 = square.left_top
  pt2 = square.right_bottom
  [(pt1[0]+pt2[0])/2, (pt1[1]+pt2[1])/2]
end

# returns [slope, intercept]
def line_function(pt1, pt2)
  x1, y1 = pt1
  x2, y2 = pt2
  if pt1 == pt2
    slope = (y2-y1).to_f / (x2-x1).to_f
  else
    slope = 1
  end
  y_intercept = y1 - x1 * slope
  [slope, y_intercept]
end

class Square
  attr_reader :left_top, :left_bottom, :right_top, :right_bottom
  def initialize(left_top, left_bottom, right_top, right_bottom)
    @left_top = left_top
    @left_bottom = left_bottom
    @right_top = right_top
    @right_bottom = right_bottom
  end

end
