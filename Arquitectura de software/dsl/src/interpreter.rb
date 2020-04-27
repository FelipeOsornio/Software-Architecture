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
    @lose = object == Spock || object == Rock
    @win = object == Paper || object == Lizard
    @win
  end

  def self.+(object)
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    Subtraction.new(self, object).evaluate
  end
end

class Paper
  def self.evaluate(object)
    @lose = object == Scissors || object == Lizard
    @win = object == Spock || object == Rock
    @win
  end

  def self.+(object)
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    Subtraction.new(self, object).evaluate
  end
end

class Rock
  def self.evaluate(object)
    @lose = object == Spock || object == Paper
    @win = object == Scissors || object == Lizard
    @win
  end

  def self.+(object)
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    Subtraction.new(self, object).evaluate
  end
end

class Lizard
  def self.evaluate(object)
    @lose = object == Scissors || object == Rock
    @win = object == Spock || object == Paper
    @win
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
    @lose = object == Lizard || object == Paper
    @win = object == Scissors || object == Rock
    @win
  end

  def self.+(object)
    Sum.new(self, object).evaluate
  end

  def self.-(object)
    Subtraction.new(self, object).evaluate
  end
end

class Show
  def initialize

  end
end

puts (Paper + Scissors)

