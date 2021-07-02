=begin
Problem:

* Write a program that determines whether a triangle is : equilateral, isosceles, or scalene

Triangle : 
            * all sides MUST have a length greater than 0
            * the SUM of the lengths of any two sides MUST be greater than the length of the third side

Equilateral : all THREE sides are the same length
Isosceles   : TWO sides are the SAME length
Scalene     : all sides are different lengths

Notes:
              * Triangle : each side length MUST be greater than 0
                           the SUM of the lengths of ANY two sides MUSt be greater than the 
                           remaining side
              * Equilateral : triangle has three sides of equal length
              * Isosceles   : triangle has TWO sides of equal length
              * Scalene     : triangle has THREE sides of UNEQUAL length

Example/Test Case:
              * Triangle Class
              * Constructor method : three arguments representing length of sides
                  1. Exception is raised in the CONSTRUCTOR if any side length is <= 0
                  2. Exception is raised if lenths are NOT a valid triangle
              * a `kind` method that returns a string representing the type of triangle

Data Structures:
          Input :  integers needed to determine validity (if triangle) and type (what kind)  
          Output:  string indicating the type of triangle OR exception of invalid triangle raised

          How to collect a triangles side lengths? ----- ARRAY collection  
Algorithm: 

          * Constructor : 
                          * save the three side of lengths
                          * check whether any side length is less than 0 or equal to 0, if so, 
                            raise an exception
                          * use comparisons to determin whether the sum of any two sides is less
                            than or equal to the length of the third side, if so,
                            raise an exception 
          * `kind`      :
                          * compare the values representing the three sides
                          * if all three sides are equal length 
                            return 'equilateral'
                          * if triangle is NOT equilateral, but any two sides are equal to one another
                            return 'isosceles'
                          * if none of the sides are equal to one another, 
                            return 'scalene'

=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError, 'One or more sides is 0' if less_equal_to_zero?
    raise ArgumentError, 'Two sides sum is not greater than the other' if two_sums_less_than?
  end

  def two_sums_less_than?
    @sides[0..1].sum <= @sides[2] ||
    @sides[1..2].sum <= @sides[0] ||
    (@sides[0] + @sides[2]) <= @sides[1]
  end

  def less_equal_to_zero?
    @sides.any? { |side| side <= 0 }
  end

  def equilateral?
    @sides.all? { |side| side == @sides[0]}
  end

  def isosceles?
    'isosceles' if @sides[0] == @sides[1] && @sides[0] != @sides[2] ||
                   @sides[1] == @sides[2] && @sides[1] != @sides[0] ||
                   @sides[0] == @sides[2] && @sides[0] != @sides[1]
   end

  def scalene?
    'scalene' if @sides[0] != @sides[1] && @sides[0] != @sides[2]
  end

  def kind
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    elsif scalene?
      'scalene'
    end
  end
end




























