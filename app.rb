Dir['lib/**.*'].each { |file| require_relative file }

# Game loop
class TicTacToe
  def initialize
    @board = Board.new
    @player = Player.new
  end

  def turn
    print "\nHello, #{@player.piece}, Where do you want to play?\n" \
          "\n#{@board.display_board}>"
    @board.place_piece(@player.move(gets.chomp.to_i), @player.piece)
    switch_turn(@board.board)
  end

  private

  def switch_turn(board)
    if ::WinTest.win_or_tie?(board) == :win
      end_game(:win)
    elsif ::WinTest.win_or_tie?(board) == :tie
      end_game(:tie)
    else
      swap_pieces
      turn
    end
  end

  def end_game(state)
    case state
    when :win
      puts "*** #{@player.piece} HAS WON! ***\n"
    when :tie
      puts "Tie game, maybe next time...\n"
    end
    play_again?
  end

  def swap_pieces
    @player.piece = @player.piece == :X ? :O : :X
  end

  def play_again?
    print "Do you want to play again? (y/n) >"
    exit_choice = gets.chomp.downcase
    if exit_choice == 'y'
      TicTacToe.new.turn
    elsif exit_choice == 'n'
      exit!
    else
      play_again?
    end
  end
end

TicTacToe.new.turn
