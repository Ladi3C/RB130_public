=begin
Deetz:
      Natural Number:
      progressive numbers beginning from 0 (in this case i will use 1)
      Whole POSTIVE numbers
Problem:
        write a program  : 
                           Class `to` method: 
                           given a natural number and a set of one or more other numbers
                           returns the sum of all the multiples of the numbers in the set
                           that are LESS than the first number
                           Instance `to` method:
                           If no set is given, then use a defualt of multoles of 3 or 5
Notes: `                  * the given number from the to method should not
                          include 1 and itself
Example/TestCases:

Ex: list (3, 5) => default parameter natural number: 1, 2, 3, 4, 5, 6, 7, 8, 9
1 => is that part of the sum? NO 
3, 6, 9, 5 = 

Ex: list (7, 13, 17) natural number : 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
                                     11,12,13,14,15,16,17,18,19, 20
7, 14, 13, 17                                     
Ex: list (4, 6)  natural number: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
4, 8, 6, 12 => 30 

Implicit:
          constructor method:
                          * by default takes an array of [3, 5]
                          * otherwise can contain a random input of numbers
          `to` CLASS method : 
                          * takes one argument that is the Natural number

Data Structure:
        Input : Optional list of numbers(otherwise use 3, 5)
        Output: sum of :
                1 to the integer passed in from the `to` method that are
                multiples from the optional list or 3,5 
Algorhythm:

When an instance is created from SomeOfMultiples:
      `initialize` method : accepts optional arguments(can be 1 or more)
      `to` instance method : takes natural number (get range without 1 and itself)
                            return value of `multiple_sum`
      `multiple_sum` : get all the multiples from the natural number range and sum

When a class method `to` is called
      `to` class method has a default list of 3 and 5
      `multiple_sum` : will do the same as the instance but its a class method 

=end

class SumOfMultiples
  def initialize(*num)
    @set_of_nums = num
  end

  def to(natural_num)
    range = (set_of_nums[0]...natural_num)
    result = []
    set_of_nums.each { |base| range.each { |num| result << num if num % base == 0}}
    result.uniq.sum  
  end

  def self.to(natural_num)
    set_of_nums = [3, 5]
    range = (set_of_nums[0]...natural_num)
    result = []
    set_of_nums.each { |base| range.each { |num| result << num if num % base == 0}}
    result.uniq.sum
  end

  private

  attr_reader :set_of_nums
end


p rando = SumOfMultiples.new(7, 13, 17).to(20)
p SumOfMultiples.to(1000)























