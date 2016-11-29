# Each player
class Player
  attr_accessor :piece

  def move(choice)
    choice.between?(1,9) ? choice - 1 : RangeError
  end
end