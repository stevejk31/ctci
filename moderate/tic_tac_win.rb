# Design an algoritm to figure out if someone has won a game of tic-tac-toe

# Input:
# [
#   ["x","x","x"],
#   ["o",nil,"o"],
#   ["o","x","o"]
# ]


def tic_tac_win(board)
  #horizontal
  board.each do |row|
    ["x","o"].each do |player|
      return player if row.all? {|el| el == player}
    end
  end
  #vertical
  3.times do |col|
    ["x","o"].each do |player|
      return player if board.all? {|row| row[col] == player}
    end
  end
  #diagonal top-left to bottom-right
  ["x","o"].each do |player|
    return player if board[0][0] == player && board[1][1] == player && board[2][2] == player
  end
  #diagnoal top-right to bottom-left
  ["x","o"].each do |player|
    return player if board[2][0] == player && board[1][1] == player && board[0][2] == player
  end
  false
end
