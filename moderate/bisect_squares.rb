# Given two squares on a two-dimensional plane, find a line that would cut these
# two squares in half. Assume that the top and the bottom sides of the square run
# parallel to the x-axis.


class Square
  attr_reader :left_top, :left_bottom, :right_top, :right_bottom
  def initialize(left_top, left_bottom, right_top, right_bottom)
    @left_top = left_top
    @left_bottom = left_bottom
    @right_top = right_top
    @right_bottom = right_bottom
  end

end
