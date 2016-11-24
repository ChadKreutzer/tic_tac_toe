class Board
  
  def initialize
    @grid = Array.new(9)
  end
  
end

class Player
  attr_accessor :piece
  
  def move
  end
  
end

class Computer < Player
end

class Human < Player
end

class Piece
  attr_accessor :x_or_o
end
