# Decorator Pattern
# Date: 20-Apr-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez

class Beverage

  def initialize
    @description = ''
    @cost = 0.0
  end

  def description(new_description)
    @description + new_description
  end

  def cost(new_cost)
    @cost + new_cost
  end

end

class DarkRoast < Beverage

  def initialize
    @beverage = Beverage.new
  end

  def description
    @beverage.description('Dark Roast Coffee')
  end

  def cost
    @beverage.cost(0.99)
  end

end

class Espresso < Beverage

  def initialize
    @beverage = Beverage.new
  end

  def description
    @beverage.description('Espresso')
  end

  def cost
    @beverage.cost(1.99)
  end

end

class HouseBlend < Beverage

  def initialize
    @beverage = Beverage.new
  end

  def description
    @beverage.description('House Blend Coffee')
  end

  def cost
    @beverage.cost(0.89)
  end

end

class CondimentDecorator < Beverage

  def initialize(beverage)
    @beverage = beverage
  end

  def description(new_description)
    @beverage.description + ', ' + new_description
  end

  def cost(new_cost)
    @beverage.cost + new_cost
  end

end

class Mocha < CondimentDecorator

  def initialize(beverage)
    @condiment_decorator = CondimentDecorator.new(beverage)
  end

  def description
    @condiment_decorator.description('Mocha')
  end

  def cost
    @condiment_decorator.cost(0.20)
  end

end

class Whip < CondimentDecorator

  def initialize(beverage)
    @condiment_decorator = CondimentDecorator.new(beverage)
  end

  def description
    @condiment_decorator.description('Whip')
  end

  def cost
    @condiment_decorator.cost(0.10)
  end

end

class Soy < CondimentDecorator

  def initialize(beverage)
    @condiment_decorator = CondimentDecorator.new(beverage)
  end

  def description
    @condiment_decorator.description('Soy')
  end

  def cost
    @condiment_decorator.cost(0.15)
  end

end

class Milk < CondimentDecorator

  def initialize(beverage)
    @condiment_decorator = CondimentDecorator.new(beverage)
  end

  def description
    @condiment_decorator.description('Milk')
  end

  def cost
    @condiment_decorator.cost(0.10)
  end

end