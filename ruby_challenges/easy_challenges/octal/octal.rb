=begin
Deetz:  
        Que es un octal?
          233 # octal
          = 2*8^2 + 3*8^1 + 3*8^0
          = 2*64  + 3*8   + 3*1
          = 128   + 24    + 3
          = 155

Problem:  
        Implement octal to Decimal Conversion. whaaa?
        Given an octal string, output a decimal conversion of it.
        Treat Invalid input as OCTAL 0 ??

Example/TestCases:
Explicit:
        Do not use built in or library methods to perform conversions!
        They are looking for the code NECESSARY to perform the conversion. (snap!)
Implicit:
        * REGARDING INPUT:
          * if there are leading 0 CLEAN IT UP!!!!! ie. 011
          * No errors are raised.. if input is invalid return 0
        * INVALID INPUT:
           * if input is a string with no integers, return 0
           * if input has any alphabet characters, return 0  
           * 8 ?
           * 9 ?
           * 6789 ?
              => if the input string contains 8 or 9 it is invalid!
        * constructor method 
          * that accepts a string and stores it
        * instance method : `to_decimal`
          * will return 0 if input is invalid
          * will return code if input is valid


Data Structure:
        Input : octal string    
        Output: integer    => if input is invalid then return 0 
Algorhythm:
        * create constant that holds the alphabet in an array colllection
        * create `convert_string`
            * iterate through input string 
              must be separated
              turned into an integer if the the current character is not in the ALPHA
        * each power must be multoplied by 8 
        * figure out how to calculate the power of each integer based
        on its position in the array keeping 0 to the far right and moving up
=end

class Octal
  attr_reader :clean

  def initialize(string)
    @clean = convert_string(string)
  end

  def to_decimal
    return 0 if clean.any? { |char| INVALID.include?(char)}
    convert_to_decimal(clean)
  end
  
  private

  attr_writer :clean

  INVALID = ('a'..'z').to_a + [8, 9]
  
  def convert_string(string)
    self.clean = string.chars.map { |char| INVALID.include?(char) ? char : char.to_i}
    clean.shift if clean[0] == 0
    clean
  end
 
 def convert_to_decimal(array)
    bases = array.map.with_index { |num, idx| idx}.reverse.map { |num| 8 ** num }
    clean.map.with_index { |int, idx| int * bases[idx]}.sum
  end  
end


rando = Octal.new('abc1z')
p rando.to_decimal

alpha = Octal.new("carrot")
p alpha.to_decimal

leading = Octal.new("011")
p leading.to_decimal       #=> 9 

valid = Octal.new("130")
p valid.to_decimal         #=> 88

unsure = Octal.new("6789")
p unsure.to_decimal        #=> 0 





























