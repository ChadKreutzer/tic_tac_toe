# Main Game loop
class Game
end

# The Game Board
class Board
  attr_accessor :board, :player_move, :winner

  def intialize
    @board = Array.new(9)
    @winner = false
  end
end

# Each player the computer and the human
class Player
end
