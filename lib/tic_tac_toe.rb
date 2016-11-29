# Main Game
class Game
  def initialize
    @winner = false
    @tie = false
    @game_board = Board.new
    @player_1 = Player.new.piece = 'X'
    @player_2 = Player.new.piece = 'O'
  end

  def win_or_tie(board)
    win_state = :none
    [diagonal?(board), horizontal?(board), vertical?(board)].each do |x|
      win_state = :win if x
    end
    win_state = :tie if tie_game?(board)
    win_state
  end

  private

  def diagonal?(board)
    if [board[0], board[4], board[8]].uniq.count == 1
      true
    elsif [board[2], board[4], board[6]].uniq.count == 1
      true
    else
      false
    end
  end

  def horizontal?(board)
    if [board[0], board[1], board[2]].uniq.count == 1
      true
    elsif [board[3], board[4], board[5]].uniq.count == 1
      true
    elsif [board[6], board[7], board[8]].uniq.count == 1
      true
    else
      false
    end
  end

  def vertical?(board)
    if [board[0], board[3], board[6]].uniq.count == 1
      true
    elsif [board[1], board[4], board[7]].uniq.count == 1
      true
    elsif [board[2], board[5], board[8]].uniq.count == 1
      true
    else
      false
    end
  end

  def tie_game?(board)
    tie = true
    (0..8).each { |x| tie = false if board[x].is_a?(Numeric) }
    tie
  end
end

# The Game Board
class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    " #{@board[0]} | #{@board[1]} | #{@board[2]}\n" \
    "---+---+---\n" \
    " #{@board[3]} | #{@board[4]} | #{@board[5]}\n" \
    "---+---+---\n" \
    " #{@board[6]} | #{@board[7]} | #{@board[8]}\n" \
  end

  def place_piece(spot, piece)
    @board[spot] = piece
    @board
  end
end

# Each player
class Player
  attr_accessor :piece
end
