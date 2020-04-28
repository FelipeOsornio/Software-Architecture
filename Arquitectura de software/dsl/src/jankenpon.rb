class Sum
  def initialize(exp_a, exp_b)
    @exp_a = exp_a
    @exp_b = exp_b
  end

  def evaluate
    resultAB = @exp_a.evaluate(@exp_b)
    resultBA = @exp_b.evaluate(@exp_a)

    if resultAB
      @exp_a
    else
      @exp_b
    end
  end
end

class Subtraction
  def initialize(exp_a, exp_b)
    @exp_a = exp_a
    @exp_b = exp_b
  end

  def evaluate
    resultAB = @exp_a.evaluate(@exp_b)
    resultBA = @exp_b.evaluate(@exp_a)

    if resultAB
      @exp_b
    else
      @exp_a
    end
  end
end

class Scissors
  def self.evaluate(object)
    object == Paper || object == Lizard
  end

  def self.+(object)
    if object == Paper
      puts 'Scissors cut Paper (winner Scissors)'
    elsif object == Lizard
      puts 'Scissors decapitate Lizard (winner Scissors)'
    elsif object == Scissors
      puts 'Scissors tie (winner Scissors)'
    end
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    if object == Spock
      puts 'Spock smashes Scissors (loser Scissors)'
    elsif object == Rock
      puts 'Rock crushes Scissors (loser Scissors)'
    elsif object == Scissors
      puts 'Scissors tie (winner Scissors)'
    end
    Subtraction.new(self, object).evaluate
  end
end

class Paper
  def self.evaluate(object)
    object == Spock || object == Rock
  end

  def self.+(object)
    if object == Rock
      puts 'Paper covers Rock (winner Paper)'
    elsif object == Spock
      puts 'Paper disproves Spock (winner Paper)'
    elsif object == Paper
      puts 'Paper tie (winner Paper)'
    end
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    if object == Rock
      puts 'Scissors cut Paper (loser Paper)'
    elsif object == Spock
      puts 'Lizard eats Paper (loser Paper)'
    elsif object == Paper
      puts 'Paper tie (winner Paper)'
    end
    Subtraction.new(self, object).evaluate
  end
end

class Rock
  def self.evaluate(object)
    object == Scissors || object == Lizard

  end

  def self.+(object)
    if object == Lizard
      puts 'Rock crushes Lizard (winner Rock)'
    elsif object == Scissors
      puts 'Rock crushes Scissors (winner Rock)'
    elsif object == Rock
      puts 'Rock tie (winner Rock)'
    end
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    if object == Rock
      puts 'Paper covers Rock (loser Rock)'
    elsif object == Scissors
      puts 'Spock vaporizes Rock (loser Rock)'
    elsif object == Rock
      puts 'Rock tie (winner Rock)'
    end
    Subtraction.new(self, object).evaluate
  end
end

class Lizard
  def self.evaluate(object)
    object == Spock || object == Paper
  end

  def self.+(object)
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    Subtraction.new(self, object).evaluate
  end
end

class Spock
  def self.evaluate(object)
    object == Scissors || object == Rock
  end

  def self.+(object)
    if object == Rock
      'Spock vaporizes Rock (winner Spock)'
    end
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    Subtraction.new(self, object).evaluate
  end
end

def show(object)
  puts "Result = #{object}"
end



