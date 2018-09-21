puts "TIC-TAC-TOE!!"
board_array = []
game_round = 0
players = ["X", "O"]

def print_board(board)
  puts "    #{board[0]}\t|   #{board[1]}\t|   #{board[2]}\t"
  puts "-------------------------"
  puts "    #{board[3]}\t|   #{board[4]}\t|   #{board[5]}\t\n"
  puts "-------------------------"
  puts "    #{board[6]}\t|   #{board[7]}\t|   #{board[8]}\t\n"
end

def player_name(round, players)
   players[round % 2]
end

def is_game_finished?(round, board, players)
  if round > 8
    return true
  end

  if check_row(board, players) || check_column(board, players) || check_diagonal(board, players)
    return true
  end

  false
end

def check_row(board, players)
  # [0,1,2], [3,4,5], [6,7,8]
  rows = 0
  while(rows < 7)
    if(board[rows]  == players[0] && board[rows + 1]  == players[0] && board[rows + 2] == players[0])
      return players[0]
    end
    if(board[rows] == players[1] && board[rows + 1] == players[1] && board[rows + 2] == players[1])
      return players[1]
    end
    rows += 3
  end
  false
end

def check_column(board, players)
  # [0,3,6], [1,4,7], [2,5,8]
  rows = 0
  while(rows < 3)
    if(board[rows] == players[0] && board[rows + 3] == players[0] && board[rows + 6] == players[0])
      return players[0]
    end
    if(board[rows] == players[1] && board[rows + 1] == players[1] && board[rows + 2] == players[1])
      return players[1]
    end
    rows += 1
  end
  false
end

def check_diagonal(board, players)
  # [0,4,8], [2,4,6]
  i = 0
  while(i <= 1)
    if(board[0] == players[i] && board[4] == players[i] && board[8] == players[i])
      return players[i]
    end
    if(board[2] == players[i] && board[4] == players[i] && board[6] == players[i])
      return players[i]
    end
    i += 1
  end

  false
end

def winner(board, players)
  return check_row(board, players) if check_row(board, players)
  return check_column(board, players) if check_column(board, players)
  return check_diagonal(board, players) if check_diagonal(board, players)
end

def main(board_array, game_round, players)
  while(!is_game_finished?(game_round, board_array, players))
    player = player_name(game_round, players)

    print_board(board_array)
    puts "\n"
    puts "Player #{player} it's your turn!"

    play = gets.chomp
    board_array[play.to_i] = player

    game_round += 1
  end

  puts "\n"
  puts "Game finished!!"
  puts "\n"
  player = winner(board_array, players)
  if !player.nil?
    puts "THE WINNER IS #{player}!"
  else
    puts "DRAW!"
  end
  print_board(board_array)
end

main(board_array, game_round, players)
