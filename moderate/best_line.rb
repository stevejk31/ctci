# Given a two-dimensional graph with points on it, find a line which passes the
# most number of points.

def best_line(points)
  mean_x, mean_y = mean(points)


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
