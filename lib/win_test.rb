# Game logic
class WinTest
  WINNERS = [[0, 4, 8], [2, 4, 6], [0, 1, 2], [3, 4, 5],
             [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8]].freeze
  
  def self.win_or_tie?(board)
    new(board).win_or_tie?
  end

  def win_or_tie?
    if win?
      :win
    elsif tie_game?
      :tie
    else
      :none
    end
  end

  private

  def win?
    WINNERS.any? { |combo| board.values_at(*combo).uniq.count == 1 }
  end

  def tie_game?
    board.all? { |spot| spot.is_a?(String) }
  end
end
