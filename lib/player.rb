# Each player
class Player
  attr_accessor :piece

  def move(choice)
    choice.between?(1, 9) ? choice - 1 : bad_choice
  end

  private

  def bad_choice
    puts "Not a valid choice, try again\n>"
    c = new_choice
    move(c)
  end

  def new_choice
    gets.chomp.to_i
  end
end
