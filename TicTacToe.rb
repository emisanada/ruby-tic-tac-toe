puts "TIC-TAC-TOE!!"
board_array = []
game_round = 0
players = ["X", "O"]

def player_name(round)
  round % 2 == 0 ? "X" : "O"
end

def print_board(board)
  puts "#{board[0]}\t|#{board[1]}\t|#{board[2]}\t"
  puts "---------------------------"
  puts "#{board[3]}\t|#{board[4]}\t|#{board[5]}\t\n"
  puts "---------------------------"
  puts "#{board[6]}\t|#{board[7]}\t|#{board[8]}\t\n"
end

def is_game_finished?(round, board)
  if round > 8
    return true
  end

  if check_row(board) || check_column(board) || check_diagonal(board)
    return true
  end

  false
end

def check_row(board)
  # [0,1,2], [3,4,5], [6,7,8]
  rows = 0
  while(rows < 7)
    if(board[rows]  == "X" && board[rows + 1]  == "X" && board[rows + 2] == "X")
      return "X"
    end
    if(board[rows] == "O" && board[rows + 1] == "O" && board[rows + 2] == "O")
      return "O"
    end
    rows += 3
  end
  false
end

def check_column(board)
  # [0,3,6], [1,4,7], [2,5,8]
  rows = 0
  while(rows < 3)
    if(board[rows] == "X" && board[rows + 3] == "X" && board[rows + 6] == "X")
      return "X"
    end
    if(board[rows] == "O" && board[rows + 1] == "O" && board[rows + 2] == "O")
      return "O"
    end
    rows += 1
  end
  false
end

def check_diagonal(board)
  # [0,4,8], [2,4,6]
  i = 0
  while(i <= 1)
    if(board[0] == players[i] && board[4] == players[i] && board[8] == players[i])
      return players[i]
    end
    if(board[0] == players[i] && board[4] == players[i] && board[8] == players[i])
      return players[i]
    end
    i += 1
  end

  false
end

def winner(board)
  return check_row(board) if !check_row(board).nil?
  return check_column(board) if !check_column(board).nil?
  return check_diagonal(board) if !check_diagonal(board).nil?
  nil
end

def main
  while(!is_game_finished?(game_round, board_array))
    print_board(board_array)

    puts "Player #{player_name(game_round)} it's your turn!"

    player_x_input = gets.chomp
    board_array[player_x_input.to_i] = player_name(game_round)

    game_round += 1
  end

  puts "Game finished!!"
  if winner
    puts "The winner is #{winner}!"
  else
    puts "DRAW!"
  end
end

main
