=begin
Problem:
        * Write a program that manages robot factory settings
        * When robots come off the factory floor, they have no name
        * First time they are boot up, a random name is generated
            ex : RX937
                 BC811
        Reset Robot :   their name is WIPED
                        respond with a new randome name

        Names :         Must be random
                        Must not follow a predictable sequence
                        Solution should NOT allow the use of the same name twice
                        name should have capital letters A - Z in the first two characters
                        any digit between 0-9 in the last three characters 
                        Name should be 5 characters long 
Examples/TestCases:
Algorithm:
        * Create Robot class
        * Create a `name` getter method 
        * Create a `reset` instance method # changes name of current robot 

=end

class Robot
  attr_reader :name

  @@names = []

  def initialize
    @name = reset
    @@names << @name
  end

  def reset
    @@name.delete(name)
    loop do
      @name = randomized_name
      break unless @@names.include?(name)
    end
    name
  end

  def randomized_name
    digits = (0..9).to_a
    alpha = ("A".."Z").to_a
    counter = 0
    result = []
    while result.size < 5
      if counter <= 2
        result << digits.sample
      else
        result << alpha.sample
      end
      counter += 1  
    end
    result.reverse.join
  end

end

