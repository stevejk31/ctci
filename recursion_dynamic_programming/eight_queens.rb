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
      temp_columns.delete(col)
      new_queens =  eight_queens(row+1, temp_columns, temp_valid_pos, temp_queens)
      result += new_queens unless new_queens.empty?
    end
  end
  result.uniq
end
