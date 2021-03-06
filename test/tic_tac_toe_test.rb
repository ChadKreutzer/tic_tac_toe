require 'minitest/autorun'
Dir['./lib/*'].each { |file_name| require file_name }
# require_relative '../app.rb'

class TicTacTest < Minitest::Test
  def setup
    @b = Board.new
    @b.board = [1, 2, 3, :X, 5, 6, 7, 8, :O]
  end

  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end

  def test_board_returns_9_element_array
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal expected, ::Board.new.board
  end

  def test_display_board_shows_current_gameboard
    expected = <<-GAMEBOARD
 1 | 2 | 3
---+---+---
 X | 5 | 6
---+---+---
 7 | 8 | O
    GAMEBOARD
    assert_equal expected, @b.display_board
  end

  def test_adding_piece_to_board
    expected = :X
    assert_equal expected, ::Board.new.place_piece(4, :X)
  end

  def test_trying_to_add_piece_to_filled_spot
    with_stdin do |user|
      user.puts 4
      b = Board.new
      b.board = [1, 2, 3, :X, 5, 6, 7, 8, 9]
      expected = :O
      assert_equal expected, b.place_piece(3, :O)
    end
  end

  def test_no_win_yet
    expected = :none
    assert_equal expected, ::WinTest.win_or_tie?([:O, 2, 3,
                                                  4, :X, 6,
                                                  7, 8, :X])
  end

  def test_diagonal_winner
    expected = :win
    assert_equal expected, ::WinTest.win_or_tie?([:X, 2, 3,
                                                  4, :X, 6,
                                                  7, 8, :X])
  end

  def test_horizontal_winner
    expected = :win
    assert_equal expected, ::WinTest.win_or_tie?([:X, :X, :X,
                                                  4, 5, 6,
                                                  7, 8, 9])
  end

  def test_vertical_winner
    expected = :win
    assert_equal expected, ::WinTest.win_or_tie?([1, 2, :X,
                                                  4, 5, :X,
                                                  7, 8, :X])
  end

  def test_tie_game
    expected = :tie
    assert_equal expected, ::WinTest.win_or_tie?([:O, :X, :O,
                                                  :X, :X, :O,
                                                  :X, :O, :X])
  end

  def test_player_piece_assignment
    expected = :X
    assert_equal expected, ::Player.new.piece = :X
  end

  def test_player_good_move_choice
    expected = 4
    assert_equal expected, ::Player.new.move(5)
  end

  def test_player_bad_move_choice
    with_stdin do |user|
      user.puts 9
      expected = 8
      assert_equal expected, ::Player.new.move(10)
    end
  end
end
