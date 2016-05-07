# imagine a robot sitting on the upper left corner of grid with r rows and c columns.
# The robot can only move in two directions, right and down, but certain cells are "off limits" such that
# the robot cannot step on them. Design an algorithm to find a path for the robot from the top left to
# the bottom right.
RIGHT = [0,1]
DOWN = [-1,0]
def robot_grid(rows, columns, location = [rows,0], path = [])
  path.push(location)
  puts path if location == [0, columns]
  new_pos_right = [location[0] + RIGHT[0], location[1] + RIGHT[1]]
  new_pos_down = [location[0] + DOWN[0], location[1] + DOWN[1]]
  if valid_pos(new_pos_right) && inbounds(new_pos_right, rows, columns)
    robot_grid(rows, columns, new_pos_right, path)
  end
  if valid_pos(new_pos_down) && inbounds(new_pos_down, rows, columns)
    robot_grid(rows, columns, new_pos_right, path)
  end

end

def dynamic_robot_grid(rows, columns, location = [rows,0], path = [], cache = {})
  path.push(location)
  cache[location] = path
  puts path if location == [0, columns]
  new_pos_right = [location[0] + RIGHT[0], location[1] + RIGHT[1]]
  new_pos_down = [location[0] + DOWN[0], location[1] + DOWN[1]]
  if valid_pos(new_pos_right) && inbounds(new_pos_right, rows, columns)
    robot_grid(rows, columns, new_pos_right, path, cache) unless cache[new_pos_right]
  end
  if valid_pos(new_pos_down) && inbounds(new_pos_down, rows, columns)
    robot_grid(rows, columns, new_pos_right, path, cache) unless cache[new_pos_left]
  end
end

# there is also a graph like method to solve this problem

def valid_pos(pos)
  # create function to check valid position
  true
end

def inbounds(pos, rows, columns)
  pos[0] < rows && pos[1] < columns
end
