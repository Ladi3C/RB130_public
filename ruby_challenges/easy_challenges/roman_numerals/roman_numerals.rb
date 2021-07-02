=begin
Problem: 
          write code that converts 
          modern decminal numbers => Roman number equivalents

          I     =>    1
          V     =>    5
          X     =>    10
          L     =>    50
          C     =>    100
          D     =>    500
          M     =>    1000

          * Do not worry about numbers higher than 3000
          * RN are written by expressing each digit of the number separately. 
            Starting wtiht he left most digit.. skipping any 0's
Example/TestCases: 
          * Create a `RomanNumeral` class
              * constructor method:
                                    * accepts a non-roman integer number as an arg
                                    * does NOT raise errors
              * Method: `to_roman`  
                                    * returns the Roman Numeral representation of that number
                                      as a STRING
Data Structure:
        Input : integer
        Output: string

        Use: collection holds key conversions between numbers and roman numerals
        *  how does ascneding or descenting order impact its ease of use?
Algorithm:

constructor :
                accepts a number as an argument
                saves it
Roman numberls collection:
                create a colection that links important roman numeral strings
                do this in descending order
=end

class RomanNumeral
  attr_accessor :integer

 ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }
  def initialize(integer)
    @integer = integer
  end

  def to_roman
    roman_num = ''
    convert = integer

    ROMAN_NUMERALS.each do |k, v|
      multiplier, remainder = convert.divmod(v)
      if multiplier > 0
        roman_num += (k * multiplier)
      end
      convert = remainder
    end 
    roman_num
  end
end

























short = RomanNumeral.new(367)
p short.to_roman