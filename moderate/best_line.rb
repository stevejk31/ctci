# Given a two-dimensional graph with points on it, find a line which passes the
# most number of points.

def best_line(points)
  mean_x, mean_y = mean(points)
  slope = find_slope(mean_x, mean_y, points)
  if slope
    y_intercept = mean_y - slope * mean_y
    [slope, y_intercept]
    "y = #{slope}*x - y_intercept"
  else
    "x = #{mean_x}"
  end
end


def mean(points)
  x_total = 0
  y_total = 0
  points.each do |point|
    x_total += point[0]
    y_total += point[1]
  end
  [x_total / points.length, y_total / points.length]

end


def find_slope(mean_x, mean_y, points)
  top = 0
  bottom = 0
  points.each do |point|
    top += ((point[0] - mean_x)*(point[1] - mean_y))
    bottom += (point[0] - mean_x)**2
  end
  unless bottom == 0
    (top / bottom)
  else
    nil
  end

end
