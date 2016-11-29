require 'minitest/autorun'
require_relative '../lib/tic_tac_toe.rb'

class TicTacTest < Minitest::Test
  def test_board_returns_9_element_array
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal expected, ::Board.new.board
  end

  def test_display_board_shows_current_gameboard
    expected = <<-GAMEBOARD
 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9
    GAMEBOARD
    assert_equal expected, ::Board.new.display_board
  end

  def test_adding_piece_to_board
    expected = [1, 2, 3, 4, 'X', 6, 7, 8, 9]
    assert_equal expected, ::Board.new.place_piece(4, 'X')
  end

  def test_winner
    expected = :win
    assert_equal expected, ::Game.new.win_or_tie(['X', 2, 3, 4, 'X', 6, 7, 8, 'X'])
  end

  def test_player_piece_assignment
    expected = 'X'
    assert_equal expected, ::Player.new.piece = 'X'
  end
end