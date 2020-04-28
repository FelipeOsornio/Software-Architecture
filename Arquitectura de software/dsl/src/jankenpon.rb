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
    if object == Spock
      puts "Spock smashes Scissors (loser Scissors)\n"
    elsif object == Rock
      puts "Rock crushes Scissors (loser Scissors)\n"
    elsif object == Scissors
      puts "Scissors tie (winner Scissors)\n"
    end

    Sum.new(self, object).evaluate
  end

  def self.-(object)
    if object == Paper
      puts "Scissors cut Paper (winner Scissors)\n"
    elsif object == Lizard
      puts "Scissors decapitate Lizard (winner Scissors)\n"
    elsif object == Scissors
      puts "Scissors tie (winner Scissors)\n"
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
      puts "Scissors cut Paper (loser Paper)\n"
    elsif object == Spock
      puts "Lizard eats Paper (loser Paper)\n"
    elsif object == Paper
      puts "Paper tie (winner Paper)\n"
    end

    Sum.new(self, object).evaluate
  end

  def self.-(object)
    if object == Rock
      puts "Paper covers Rock (winner Paper)\n"
    elsif object == Spock
      puts "Paper disproves Spock (winner Paper)\n"
    elsif object == Paper
      puts "Paper tie (winner Paper)\n"
    end
    Subtraction.new(self, object).evaluate
  end
end

class Rock
  def self.evaluate(object)
    object == Scissors || object == Lizard

  end

  def self.+(object)
    if object == Rock
      puts "Paper covers Rock (loser Rock)\n"
    elsif object == Scissors
      puts "Spock vaporizes Rock (loser Rock)\n"
    elsif object == Rock
      puts "Rock tie (winner Rock)\n"
    end

    Sum.new(self, object).evaluate
  end

  def self.-(object)
    if object == Lizard
      puts "Rock crushes Lizard (winner Rock)\n"
    elsif object == Scissors
      puts "Rock crushes Scissors (winner Rock)\n"
    elsif object == Rock
      puts "Rock tie (winner Rock)\n"
    end
    Subtraction.new(self, object).evaluate
  end
end

class Lizard
  def self.evaluate(object)
    object == Spock || object == Paper
  end

  def self.+(object)
    if object == Scissors
      puts "Scissors decapitate Lizard (loser Lizard)\n"
    elsif object == Rock
      puts "Rock crushes Lizard (loser Lizard)\n"
    elsif object == Lizard
      puts "Lizard tie (loser Lizard)\n"
    end

    Sum.new(self, object).evaluate
  end

  def self.-(object)
    if object == Spock
      puts "Lizard poisons Spock (winner Lizard)\n"
    elsif object == Paper
      puts "Lizard eats Paper (winner Lizard)\n"
    elsif object == Lizard
      puts "Lizard tie (winner Lizard)\n"
    end

    Subtraction.new(self, object).evaluate
  end
end

class Spock
  def self.evaluate(object)
    object == Scissors || object == Rock
  end

  def self.+(object)
    if object == Scissor
      puts "Spock smashes Scissors (winner Spock)\n"
    elsif object == Rock
      puts "Spock vaporizes Rock (winner Spock)\n"
    elsif object == Spock
      puts "Spock tie (winner Spock)\n"
    end

    Sum.new(self, object).evaluate
  end

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

show Spock - Paper


