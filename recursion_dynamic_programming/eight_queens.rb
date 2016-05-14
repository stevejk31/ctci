# Write an algorithm to print all ways of arranging 8 queens on an 8x8 chess board
# so that none of them share the same row, column, or diagonal. in this case, "diagonal" means all
# diagonals, not just the two that bisect the board

def eight_queens(row=0, columns=(0..7).to_a, valid_pos = {},queens = [])
  return [queens] if queens.length == 8
  result = []
  columns.each do |col|
    pos = [row, col]
    temp_valid_pos = valid_pos.clone
    temp_queens = queens.clone
    temp_columns = columns.clone
    if temp_queens.all? {|queen_pos|(queen_pos[0].abs - pos[0].abs).abs != (queen_pos[1] - pos[1].abs).abs}
      temp_queens.push(pos)
      col_insert(pos, temp_valid_pos)
      row_insert(pos, temp_valid_pos)
      diagonal_insert(pos, temp_valid_pos)
      temp_columns.delete(col)
      new_queens =  eight_queens(row+1, temp_columns, temp_valid_pos, temp_queens)
      result += new_queens unless new_queens.empty?
    end
  end
  result.uniq
end

def check_valid?(pos, valid_pos)
  valid_pos[pos].nil?
end

def col_insert(pos, valid_pos)
  col = pos[1]
  (0..7).each do |row|
    valid_pos[[row, col]] = true
  end
  valid_pos
end

def row_insert(pos, valid_pos)
  row = pos[0]
  (0..7).each do |col|
    valid_pos[[row, col]] = true
  end
  valid_pos
end

def diagonal_insert(pos, valid_pos)
  row, col = pos
  case row <=> col
  when -1
    col = col-row
    row = 0
  when 0
    row, col = 0, 0
  when 1
    row = row - col
    col = 0
  end
  while row < 8 && col < 8
    valid_pos[[row,col]] = true
    row += 1
    col += 1
  end
  return valid_pos
end
