class Student
  attr_accessor :name

  @@num_students = 0

  def initialize(name, grade)
    @name = name
    @grade = grade
    @@num_students += 1
  end

  def self.number_of_students
    str = "Student population - #{@@num_students} student"
    str << (@@num_students > 1 ? "s." : ".")
  end

  def better_grade_than?(other_name)
    grade > other_name.grade
  end

  def hi
    "Hey, it's me #{name}."
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 95)
puts Student.number_of_students
bob = Student.new("Bob", 85)
puts Student.number_of_students
puts ""
# puts joe.grade
puts "Well done!" if joe.better_grade_than?(bob)
puts joe.hi