# Main Game loop
class Game
end

# The Game Board
class Board
  attr_accessor :board, :winner

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner = false
  end

  def display_board
    " #{@board[0]} | #{@board[1]} | #{@board[2]}\n" \
    "---+---+---\n" \
    " #{@board[3]} | #{@board[4]} | #{@board[5]}\n" \
    "---+---+---\n" \
    " #{@board[6]} | #{@board[7]} | #{@board[8]}\n" \
  end

  def player_move(spot, piece)
    @board[spot] = piece
    @board
  end

  def win_test(current_board)
  end
end

# Each player
class Player
end
