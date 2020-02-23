# Template Method Pattern
# Date: 24-Feb-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez

# The source code models a student object and
# implements different methods about the object.

# A class that models a student object.
class Student

  include Enumerable
  # Note: This class does not support the max, min,
  # or sort methods.

  # Init the constructor throughout their parameters.
  def initialize(id, name, grades)
    @id = id
    @name = name
    @grades = grades
  end

  # Returns an string with all student information.
  def inspect
    "Student(#{@id}, #{@name.inspect})"
  end

  # Returns the grade average of the student.
  def grade_average
    @grades.inject(:+) / @grades.size
  end

  # Return the id, name, the grades and the average of the student.
  def each(&block)
    yield @id
    yield @name
    @grades.each(&block)
    yield grade_average
  end

end