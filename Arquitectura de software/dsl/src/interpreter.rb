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
  def evaluate(object)
    @lose = false # object.class == Spock || object.class == Rock
    @win = object.class == Paper # || object.class == Lizard
    @win
  end

  def +(object)
    Sum.new(self, object).evaluate.class
  end

  def -(object)
    Subtraction.new(self, object).evaluate.class
  end
end

class Paper
  def evaluate(object)
    @lose = object.class == Scissors # || object.class == Lizard
    @win = false # object.class == Spock || object.class == Rock
    @win
  end

  def +(object)
    Sum.new(self, object).evaluate.class
  end

  def -(object)
    Subtraction.new(self, object).evaluate.class
  end
end

puts Paper == (Paper.new - Scissors.new)

