# Given two straight line segments (represented as a start point and an end point),
# compute the point of intersection, if any
#
# (y - y1) = (y1-y2)/(x1-x2)(x - x2)
# (y - y3) = (y3-y4)/(x3-x4)(x - x3)

# line1 = [[x1a,y1a],[x1b,y1b]]
# line2 = [[x2a,y2a],[x2b,y2b]]

def intersection(line1, line2)
  x1a, y1a = line1[0]
  x1b, y1b = line1[1]
  x2a, y2a = line2[0]
  x2b, y2b = line2[1]
  return line1[0] if line1[0] == line2[0]
  return line1[1] if line1[1] == line2[1]
  return line2[0] if line2[0] == line1[1]
  return line2[1] if line2[1] == line1[0]
  slope1 = (y1b-y1a).to_f / (x1b-x1a).to_f
  y_intercept1 = y1a - x1a * slope1
  slope2 = (y2b-y2a).to_f / (x2b-x2a).to_f
  y_intercept2 = y2a - x2a *slope2

  end
  if slope1 == slope2 && y_intercept1 == y_intercept2
    #paralell
    return line1[0] if x1a.between?(x2a,x2b)
    return line1[1] if x1b.between?(x2a,x2b)
    return line2[0] if x2a.between?(x1a,x1b)
    return line2[1] if x2b.between?(x1a,x1b)
  else
    #interesecting
    intersection = calc_intersection(slope1, y_intercept1, slope2, y_intercept2)
    return intersection if between?(intersection, [x1a, x1b], [y1a, y1b]) && between?(intersection, [x2a, x2b], [y2a,y2b])
  end
  false
end

def between?(point, x_range, y_range)
  x = point[0]
  y = point[1]
  x1, x2 = x_range.sort
  y1, y2 = y_range.sort

  x.between?(x1,x2) && y.between?(y1,y2)
end

def calc_intersection(slope1, intercept1, slope2, intercept2)
  x = (intercept1 - intercept2).to_f / (slope2 - slope1).to_f
  y = slope1*x + intercept1
  [x,y]
end
