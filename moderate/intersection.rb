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
  slope1 = (y1b-y1a).to_f / (x1b-x1a).to_f
  slope2 = (y2b-y2a).to_f / (x2b-x2a).to_f
  if slope1 == slope2
    #paralell
    
  else
    #interesecting

  end
  # if between?([x1a,x1b], [x2a, y2a]) && between?([y1a, y1b], [y2a,y2b])
end

def between?(array1, array2)
  a,b = array1
  c,d = array2
  a.between(c,d) || b.between(c,d)

end
