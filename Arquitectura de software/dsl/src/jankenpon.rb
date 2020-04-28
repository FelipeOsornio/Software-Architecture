# Domain-Specific Language Pattern
# Date: 27-Apr-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez
# File: jankenpon.rb

# This class models the sum operation between two
# possibilities of the game Rock-Paper-Scissors-Lizard-Spock
class Sum

  # Method that initialize the class sum receiving two items of the game
  def initialize(exp_a, exp_b)
    @exp_a = exp_a
    @exp_b = exp_b
  end

  # Method that call the evaluation method of the first object
  # and using the second one as parameter
  def evaluate
    @exp_a.evaluate(@exp_b) ? @exp_a : @exp_b
  end
end

# This class models the subtraction operation between two
# possibilities of the game Rock-Paper-Scissors-Lizard-Spock
class Subtraction

  # Method that initialize the class sum receiving two items of the game
  def initialize(exp_a, exp_b)
    @exp_a = exp_a
    @exp_b = exp_b
  end

  # Method that call the evaluation method of the first object
  # and using the second one as parameter
  def evaluate
    @exp_a.evaluate(@exp_b) ? @exp_b : @exp_a
  end
end

# This class models in game behaviour of the Scissors game object
class Scissors

  # Method that evaluates the Scissors object respect other
  # object passed as an argument
  def self.evaluate(object)
    object == Paper || object == Lizard
  end

  # Method that defines the output string of the sum operation depending
  # on the object that receives as argument, and then executes the the sum
  # interpreter operation.
  def self.+(object)
    if object == Spock
      puts "Spock smashes Scissors (winner Spock)\n"
    elsif object == Rock
      puts "Rock crushes Scissors (winner Rock)\n"
    elsif object == Lizard
      puts "Scissors decapitate Lizard (winner Scissors)\n"
    elsif object == Scissors
      puts "Scissors tie (winner Scissors)\n"
    end
    Sum.new(self, object).evaluate
  end

  # Method that defines the output string of the subtraction operation depending
  # on the object that receives as argument, and then executes the the subtraction
  # interpreter operation.
  def self.-(object)
    if object == Paper
      puts "Scissors cut Paper (loser Paper)\n"
    elsif object == Lizard
      puts "Scissors decapitate Lizard (loser Lizard)\n"
    elsif object == Scissors
      puts "Scissors tie (loser Scissors)\n"
    end

    Subtraction.new(self, object).evaluate
  end
end

# This class models in game behaviour of the Paper game object
class Paper

  # Method that evaluates the Paper object respect other
  # object passed as an argument
  def self.evaluate(object)
    object == Spock || object == Rock
  end

  # Method that defines the output string of the sum operation depending
  # on the object that receives as argument, and then executes the the sum
  # interpreter operation.
  def self.+(object)
    if object == Rock
      puts "Paper covers Rock (winner Paper)\n"
    elsif object == Scissors
      puts "Scissors cut Paper (winner Scissors)\n"
    elsif object == Lizard
      puts "Lizard eats Paper (winner Lizard)\n"
    elsif object == Spock
      puts "Paper disproves Spock (winner Paper)\n"
    elsif object == Paper
      puts "Paper tie (winner Paper)\n"
    end

    Sum.new(self, object).evaluate
  end

  # Method that defines the output string of the subtraction operation depending
  # on the object that receives as argument, and then executes the the subtraction
  # interpreter operation.
  def self.-(object)
    if object == Rock
      puts "Paper covers Rock (loser Rock)\n"
    elsif object == Scissors
      puts "Scissors cut Paper (loser Paper)\n"
    elsif object == Spock
      puts "Paper disproves Spock (loser Spock)\n"
    elsif object == Lizard
      puts "Lizard eats Paper (loser Paper)\n"
    elsif object == Paper
      puts "Paper tie (loser Paper)\n"
    end

    Subtraction.new(self, object).evaluate
  end
end

# This class models in game behaviour of the Rock game object
class Rock

  # Method that evaluates the Rock object respect other
  # object passed as an argument
  def self.evaluate(object)
    object == Scissors || object == Lizard
  end

  # Method that defines the output string of the sum operation depending
  # on the object that receives as argument, and then executes the the sum
  # interpreter operation.
  def self.+(object)
    if object == Paper
      puts "Paper covers Rock (winner Paper)\n"
    elsif object == Spock
      puts "Spock vaporizes Rock (winner Spock)\n"
    elsif object == Rock
      puts "Rock tie (winner Rock)\n"
    end

    Sum.new(self, object).evaluate
  end

  # Method that defines the output string of the subtraction operation depending
  # on the object that receives as argument, and then executes the the subtraction
  # interpreter operation.
  def self.-(object)
    if object == Lizard
      puts "Rock crushes Lizard (loser Lizard)\n"
    elsif object == Paper
      puts "Paper covers Rock (loser Rock)\n"
    elsif object == Scissors
      puts "Rock crushes Scissors (loser Scissors)\n"
    elsif object == Rock
      puts "Rock tie (loser Rock)\n"
    end
    Subtraction.new(self, object).evaluate
  end
end

# This class models in game behaviour of the Lizard game object
class Lizard

  # Method that evaluates the Lizard object respect other
  # object passed as an argument
  def self.evaluate(object)
    object == Spock || object == Paper
  end

  # Method that defines the output string of the sum operation depending
  # on the object that receives as argument, and then executes the the sum
  # interpreter operation.
  def self.+(object)
    if object == Scissors
      puts "Scissors decapitate Lizard (winner Scissors)\n"
    elsif object == Rock
      puts "Rock crushes Lizard (winner Rock)\n"
    elsif object == Lizard
      puts "Lizard tie (winner Lizard)\n"
    end

    Sum.new(self, object).evaluate
  end

  # Method that defines the output string of the subtraction operation depending
  # on the object that receives as argument, and then executes the the subtraction
  # interpreter operation.
  def self.-(object)
    if object == Spock
      puts "Lizard poisons Spock (loser Spock)\n"
    elsif object == Paper
      puts "Lizard eats Paper (loser Paper)\n"
    elsif object == Lizard
      puts "Lizard tie (loser Lizard)\n"
    end

    Subtraction.new(self, object).evaluate
  end
end

#This class models in game behaviour of the Spock game object
class Spock

  # Method that evaluates the Spock object respect other
  # object passed as an argument
  def self.evaluate(object)
    object == Scissors || object == Rock
  end

  # Method that defines the output string of the sum operation depending
  # on the object that receives as argument, and then executes the the sum
  # interpreter operation.
  def self.+(object)
    if object == Scissors
      puts "Spock smashes Scissors (winner Spock)\n"
    elsif object == Lizard
      puts "Lizard poisons Spock (winner Lizard)\n"
    elsif object == Rock
      puts "Spock vaporizes Rock (winner Spock)\n"
    elsif object == Paper
      puts "Paper disproves Spock (winner Paper)\n"
    elsif object == Spock
      puts "Spock tie (winner Spock)\n"
    end

    Sum.new(self, object).evaluate
  end

  # Method that defines the output string of the subtraction operation depending
  # on the object that receives as argument, and then executes the the subtraction
  # interpreter operation.
  def self.-(object)
    if object == Paper
      puts "Paper disproves Spock (loser Spock)\n "
    elsif object == Lizard
      puts "Lizard poisons Spock (loser Spock)\n"
    elsif object == Spock
      puts "Spock tie (loser Spock)\n"
    end

    Subtraction.new(self, object).evaluate
  end
end

def show(object)
  puts "Result = #{object}\n"
end



