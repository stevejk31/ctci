# Implement the "paint fill function" that one might see on many image editing programs.
# That is, given a screen (represented by two-dimnsional array of colors), a point, and a new color,
# fill in the surrounding area until the color changes from the original color.
RIGHT = [0,1]
UP = [1,0]
DOWN = [-1,0]
LEFT = [0,-1]
def paint_fill(screen, pointer, color, prev_color = screen[pointer[0]][pointer[1]], cache ={})
  if screen[pointer[0]][pointer[1]] == prev_color && cache[pointer].nil?
    screen[pointer[0]][pointer[1]] = color
    cache[pointer] = true
    up = new_pos(pointer, UP)
    paint_fill(screen, up, color, prev_color, cache) if valid_loc?(screen, up, prev_color, color)
    right = new_pos(pointer, RIGHT)
    paint_fill(screen, right, color, prev_color, cache) if valid_loc?(screen, right, prev_color, color)
    left = new_pos(pointer, LEFT)
    paint_fill(screen, left, color, prev_color, cache) if valid_loc?(screen, left, prev_color, color)
    down = new_pos(pointer, DOWN)
    paint_fill(screen, down, color, prev_color, cache) if valid_loc?(screen, down, prev_color, color)
  end
  screen
end

def new_pos(pos, move)
  [pos[0]+move[0], pos[1]+move[1]]
end

def in_bounds?(pos, screen)
  pos[0] >= 0 && pos[0] < screen.length &&
    pos[1] >= 0 && pos[1] < screen[0].length
end

def valid_loc?(screen, pos, prev_color, color)
  in_bounds?(pos, screen) && screen[pos[0]][pos[1]] == prev_color && screen[pos[0]][pos[1]] != color
end
