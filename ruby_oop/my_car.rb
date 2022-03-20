=begin
Create a class called MyCar. When you initialize a new instance or object of the class, 
allow the user to define some instance variables that tell us the year, color, and model of the car.
Create an instance variable that is set to 0 during instantiation of the object to track the current
speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.
=end

class MyCar
  attr_accessor :year, :color, :model

  def initialize(y, c, m, s = 0)
    @year = y
    @color = c
    @model = m
    @speed = s
  end

  def gas_pedal(int)
    @speed += int
    puts '*vroom vroom!*'
    info
  end

  def break_pedal(int)
    self.speed -= int
    puts '*screeeech*'
    info
  end

  def info
    puts "Your #{color} #{model} is going #{@speed} mph."
  end
end

my_new_car = MyCar.new("2020", "green", "batmobile")
my_new_car.info
my_new_car.gas_pedal(5)