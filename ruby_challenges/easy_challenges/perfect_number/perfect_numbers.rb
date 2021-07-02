=begin
Deetz:
        Aliquot sum  : comparison between the number and the sum of its divisors (positive)
        perfect  : sum is EQUAL to the number
        abundant : sum is GREATER than the original number
        deficient: sum is LESS than the original number

Problem:
        Write a program that returns a string categorizing its aliquot sum
        Perfect, Abundant, Deficient 

Examples/Test Cases:

Implicit Edgecases:
        * raise StandardError if number is less than 0

Data Structure:
        Input : Integer
        Output: String
        Iterator: that will iterate through range and return divisors

Algorhythm:
        Explicit Methods
        * Create PerfectNumber Class
        * Class Method:
          classify => 
          accepts an integer as an argument stores it in a class variable
          returns a string based on its aliquot sum or raises an error (n < 0)

        Implicit Helper methods
        * `divisors_sum` will return the sum of divisors (excludes the input integer)
      
=end


class PerfectNumber  
  def self.classify(number)
    @@number = number
    raise ArgumentError.new("Number must me greater than zero") if @@number < 1
    if divisors_sum == @@number  
      'perfect'
    elsif divisors_sum < @@number
      'deficient'
    elsif divisors_sum > @@number
      'abundant'
    end 
  end

  def self.divisors_sum
    (1...@@number).select { |num| @@number % num == 0}.sum
  end

end


# # negativo = PerfectNumber.new
# # negativo.classify(-1)

# deficient = PerfectNumber.new
# p deficient.classify(15) #deficient sum is less than 15
# p deficient.divisors_sum

# abundant = PerfectNumber.new
# p abundant.classify(24)
# p abundant.divisors_sum


# perfect = PerfectNumber.new
# p perfect.classify(28)
# p perfect.divisors_sum
