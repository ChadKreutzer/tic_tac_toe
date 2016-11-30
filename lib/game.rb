# Game logic
class Game
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
    if [board[0], board[4], board[8]].uniq.count == 1 ||
       [board[2], board[4], board[6]].uniq.count == 1
      true
    else
      false
    end
  end

  def horizontal?(board)
    if [board[0], board[1], board[2]].uniq.count == 1 ||
       [board[3], board[4], board[5]].uniq.count == 1 ||
       [board[6], board[7], board[8]].uniq.count == 1
      true
    else
      false
    end
  end

  def vertical?(board)
    if [board[0], board[3], board[6]].uniq.count == 1 ||
       [board[1], board[4], board[7]].uniq.count == 1 ||
       [board[2], board[5], board[8]].uniq.count == 1
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
