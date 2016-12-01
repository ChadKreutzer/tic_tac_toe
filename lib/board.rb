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
    @piece = piece
    @board[spot] = empty_spot?(spot) ? @piece : bad_choice
  end

  private

  def empty_spot?(spot)
    @board[spot].is_a?(Symbol) ? false : true
  end

  def bad_choice
    puts "That spot is taken, try again\n>"
    c = new_choice
    place_piece(c, @piece)
  end

  def new_choice
    gets.chomp.to_i
  end
end
