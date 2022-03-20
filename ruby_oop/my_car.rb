=begin
Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that 
isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that 
stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant 
defined that separates it from the MyCar class in some way.
=end

module Workable
  def work
    "Honk Honk! I'm working!"
  end

  def can_tow?(load_lbs)
    load_lbs < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color, :model, :speed, :number_of_cars
  attr_reader :year, :age

  @@number_of_vehicles = 0

  def self.how_many_vehicles
    if @@number_of_vehicles == 1
      puts "There is #{@@number_of_vehicles} vehicle on the lot."
    else
      puts "There are #{@@number_of_vehicles} vehicles on the lot."
    end
  end

  def self.mpg(m, g)
    puts "Your car gets #{m / g} miles per gallon"
  end

  def initialize(y, c, m, s = 0)
    @year = y
    self.color = c
    self.model = m
    self.speed = s
    @@number_of_vehicles += 1
  end

  def gas_pedal(int)
    self.speed += int
    puts '*vroom vroom!*'
    info
  end

  def break_pedal(int)
    self.speed -= int
    puts '*screeeech*'
    info
  end

  def stop
    self.speed = 0
    puts "Stopping!"
    info
  end

  def spray_paint(color)
    self.color = color
    puts "You spray painted your car #{color}!"
  end

  def info
    puts "Your #{color} #{model} is going #{speed} mph."
  end

  def to_s
    "Your #{color} #{model} is going #{speed} mph."
  end

  def age
    "Your #{model} is #{calculate_age} years old."
  end

  private

  def calculate_age
    Time.now.year - self.year.to_i
  end
end

class MyCar < Vehicle
  DOORS = 4
end

class MyTruck < Vehicle
  include Workable
  FLAT_BED = true
  DOORS = 2
end

# puts MyCar.ancestors
# puts ""
# puts MyTruck.ancestors

my_new_car = MyCar.new(1920, "green", "batmobile")
# my_new_car.info
# Vehicle.how_many_vehicles
my_truck = MyTruck.new("2000", "purple", "18-wheeler")
puts my_new_car.age
puts my_truck.age

# my_truck.info
# Vehicle.how_many_vehicles
# puts my_truck.work
# puts my_truck.can_tow?(2900)

# my_new_car.gas_pedal(5)
# my_new_car.break_pedal(3)
# my_new_car.stop
# my_new_car.spray_paint("yellow")
# my_new_car.info
# my_new_car.info
# p my_new_car
# MyCar.mpg(30, 5)