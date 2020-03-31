# Command Pattern
# Date: 30-Mar-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez

# File: control.rb

#This class represents the abstract model of a Remote Control with undo.
class RemoteControlWithUndo

  # Initalizes the 2 arrays that stores 7 on/off commands and the undo command.
  def initialize
    @on_commands = []
    @off_commands = []
    no_command = NoCommand.new
    7.times do
      @on_commands << no_command
      @off_commands << no_command
    end
    @undo_command = no_command
  end

  # Sets the on/off commands in a given slot.
  def set_command(slot, on_command, off_command)
    @on_commands[slot] = on_command
    @off_commands[slot] = off_command
  end

  # Listen and executes the on command of a given slot.
  def on_button_was_pushed(slot)
    @on_commands[slot].execute
    @undo_command = @on_commands[slot]
  end

  # Listen and executes the off command of a given slot.
  def off_button_was_pushed(slot)
    @off_commands[slot].execute
    @undo_command = @off_commands[slot]
  end

  # Listen and undo the last command executed.
  def undo_button_was_pushed()
    @undo_command.undo
  end

  # Prints the info about the current slots and commands in the control.
  def inspect
    string_buff = ["\n------ Remote Control -------\n"]
    @on_commands.zip(@off_commands) \
        .each_with_index do |commands, i|
      on_command, off_command = commands
      string_buff << \
      "[slot #{i}] #{on_command.class}  " \
        "#{off_command.class}\n"
    end
    string_buff << "[undo] #{@undo_command.class}\n"
    string_buff.join
  end
end

# Represents the abstract model of a No Command class.
class NoCommand

  # represents an empty execute method.
  def execute
  end

  # represents an empty undo method.
  def undo
  end

end

# class that represents the object Light.
class Light

  attr_reader :level

  # Initializes the light location and it's level.
  def initialize(location)
    @location = location
    @level = 0
  end

  # Sets the light ON.
  def on
    @level = 100
    puts "Light is on"
  end

  # Sets the light OFF.
  def off
    @level = 0
    puts "Light is off"
  end

  # Sets a custom level of light.
  def dim(level)
    @level = level
    if level == 0
      off
    else
      puts "Light is dimmed to #{@level}%"
    end
  end

end

# Class that represents the object CeilingFan.
class CeilingFan

  # Access these constants from outside this class as
  # CeilingFan::HIGH, CeilingFan::MEDIUM, and so on.
  HIGH = 3
  MEDIUM = 2
  LOW = 1
  OFF = 0

  attr_reader :speed

  # Initializes the location an speed of the CeilingFan.
  def initialize(location)
    @location = location
    @speed = OFF
  end

  # Sets the high speed of the fan.
  def high
    @speed = HIGH
    puts "#{@location} ceiling fan is on high"
  end

  # Sets the medium speed of the fan.
  def medium
    @speed = MEDIUM
    puts "#{@location} ceiling fan is on medium"
  end

  # Sets the low speed of the fan.
  def low
    @speed = LOW
    puts "#{@location} ceiling fan is on low"
  end

  # Turns OFF the fan.
  def off
    @speed = OFF
    puts "#{@location} ceiling fan is off"
  end

end

# Class that defines LightOn command.
class LightOnCommand < Light

  # Initializes light parameter.
  def initialize(light)
    @light = light
  end

  # Runs light on action.
  def execute
    @light.on
  end

  # Undoes the last action.
  def undo
    @light.off
  end
end

# Class that defines LightOff command
class LightOffCommand < Light

  # Initializes light parameter.
  def initialize(light)
    @light = light
  end

  # Runs light on action.
  def execute
    @light.off
  end

  # Undoes the last action.
  def undo
    @light.on
  end
end

# Class that defines CeilingFanHigh command.
class CeilingFanHighCommand < CeilingFan

  # Initializes fan and last speed parameters.
  def initialize(fan)
    @fan = fan
    @last_speed = nil
  end

  # Assigns fan speed to last speed and its own class speed.
  def execute
    @last_speed = @fan.speed
    @fan.high
  end

  # Returns the speed in accordance to the last speed.
  def undo
    @last_speed == CeilingFan::HIGH ? @fan.high :
        @last_speed == CeilingFan::MEDIUM ? @fan.medium :
            @last_speed == CeilingFan::LOW ? @fan.low : @fan.off
  end
end

# Class that defines CeilingFanMedium command
class CeilingFanMediumCommand < CeilingFan

  # Initializes fan and last speed parameters.
  def initialize(fan)
    @fan = fan
    @last_speed = nil
  end

  # Assigns fan speed to last speed and its own class speed.
  def execute
    @last_speed = @fan.speed
    @fan.medium
  end

  # Returns the speed in accordance to the last speed.
  def undo
    @last_speed == CeilingFan::HIGH ? @fan.high :
        @last_speed == CeilingFan::MEDIUM ? @fan.medium :
            @last_speed == CeilingFan::LOW ? @fan.low : @fan.off
  end
end

# Class that defines CeilingFanOff command
class CeilingFanOffCommand < CeilingFan

  # Initializes fan and last speed parameters.
  def initialize(fan)
    @fan = fan
    @last_speed = nil
  end

  # Assigns fan speed to last speed and its own class speed.
  def execute
    @last_speed = @fan.speed
    @fan.off
  end

  # Returns the speed in accordance to the last speed.
  def undo
    @last_speed == CeilingFan::HIGH ? @fan.high :
        @last_speed == CeilingFan::MEDIUM ? @fan.medium :
            @last_speed == CeilingFan::LOW ? @fan.low : @fan.off
  end
end