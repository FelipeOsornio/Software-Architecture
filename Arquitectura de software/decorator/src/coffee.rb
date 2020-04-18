# Decorator Pattern
# Date: 20-Apr-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez

# This class models a beverage object
class Beverage

  # This method initialize object with an empty description and cost
  def initialize
    @description = ''
    @cost = 0.0
  end

  # Method that updates the description of the beverage
  def description(new_description)
    @description + new_description
  end

  # Method that updates the cost of the beverage
  def cost(new_cost)
    @cost + new_cost
  end

end

# Class that models the DarkRoast beverage object
class DarkRoast < Beverage

  # Method that initialize a new DarkRoast beverage
  def initialize
    @beverage = Beverage.new
  end

  # Method that calls the beverage description function,
  # setting up the new description string
  def description
    @beverage.description('Dark Roast Coffee')
  end

  # Method that calls the beverage cost function,
  # setting up the new cost value
  def cost
    @beverage.cost(0.99)
  end

end

# Class that models the Espresso beverage object
class Espresso < Beverage

  # Method that initialize a new Espresso beverage
  def initialize
    @beverage = Beverage.new
  end

  # Method that calls the beverage description function,
  # setting up the new description string
  def description
    @beverage.description('Espresso')
  end

  # Method that calls the beverage cost function,
  # setting up the new cost value
  def cost
    @beverage.cost(1.99)
  end

end

# Class that models the HouseBlend beverage object
class HouseBlend < Beverage

  # Method that initialize a new HouseBlend beverage
  def initialize
    @beverage = Beverage.new
  end

  # Method that calls the beverage description function,
  # setting up the new description string
  def description
    @beverage.description('House Blend Coffee')
  end

  # Method that calls the beverage cost function,
  # setting up the new cost value
  def cost
    @beverage.cost(0.89)
  end

end

# class that models the CondimentDecorator object
class CondimentDecorator < Beverage

  # Method that receives a beverage object and
  # initializes a new Condiment Decorator object
  def initialize(beverage)
    @beverage = beverage
  end

  # Method that updates the description string from a beverage
  def description(new_description)
    @beverage.description + ', ' + new_description
  end

  # Method that updates the cost string from a beverage
  def cost(new_cost)
    @beverage.cost + new_cost
  end

end

# Class that models the Mocha condiment object
class Mocha < CondimentDecorator

  # Method that receives a beverage object and initialize
  # a new CondimentDecorator object using the beverage as parameter
  def initialize(beverage)
    @condiment_decorator = CondimentDecorator.new(beverage)
  end

  # Method that calls the update description method of
  # CondimentDecorator and sends a new description string
  def description
    @condiment_decorator.description('Mocha')
  end

  # Method that calls the update cost method of
  # CondimentDecorator and sends a new cost value
  def cost
    @condiment_decorator.cost(0.20)
  end

end

# Class that models the Whip condiment object
class Whip < CondimentDecorator

  # Method that receives a beverage object and initialize
  # a new CondimentDecorator object using the beverage as parameter
  def initialize(beverage)
    @condiment_decorator = CondimentDecorator.new(beverage)
  end

  # Method that calls the update description method of
  # CondimentDecorator and sends a new description string
  def description
    @condiment_decorator.description('Whip')
  end

  # Method that calls the update cost method of
  # CondimentDecorator and sends a new cost value
  def cost
    @condiment_decorator.cost(0.10)
  end

end

# Class that models the Soy condiment object
class Soy < CondimentDecorator

  # Method that receives a beverage object and initialize
  # a new CondimentDecorator object using the beverage as parameter
  def initialize(beverage)
    @condiment_decorator = CondimentDecorator.new(beverage)
  end

  # Method that calls the update description method of
  # CondimentDecorator and sends a new description string
  def description
    @condiment_decorator.description('Soy')
  end

  # Method that calls the update cost method of
  # CondimentDecorator and sends a new cost value
  def cost
    @condiment_decorator.cost(0.15)
  end

end

# Class that models the Soy condiment object
class Milk < CondimentDecorator

  # Method that receives a beverage object and initialize
  # a new CondimentDecorator object using the beverage as parameter
  def initialize(beverage)
    @condiment_decorator = CondimentDecorator.new(beverage)
  end

  # Method that calls the update description method of
  # CondimentDecorator and sends a new description string
  def description
    @condiment_decorator.description('Milk')
  end

  # Method that calls the update cost method of
  # CondimentDecorator and sends a new cost value
  def cost
    @condiment_decorator.cost(0.10)
  end

end