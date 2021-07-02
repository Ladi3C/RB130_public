=begin
Problem:
        Write a program that will take a string
        and return all the possible consecutive number series
        of a SPECIFIED length in that string

        Throw an ERROR if the series is larger then the length of the input string

Example/Test Cases:
        ex 1 : '01234' series: 3
        => [012, 123, 234]

        * Create a `Series` class
        * create an attribute reader for `@slice_string`
        * Constructor method : input string given ..store it
            * store in variable called `@slice_string`
        * `slices` instance method: inputs the series (HOW LONG RETURN SHOULD BE)
          * Raise an ArgumentError if the series is greater than strin glength
          * return all possible consecutive number series of the input series length 

        ex 2: This is how i get each consecutive
        a = '98273463'

        a.chars.map(&:to_i).each_cons(2).to_a

Data Structure:
        Input : constructor method => string
                `slices` method => integer represents series of consecuties nums to be returned

        Output: nested array of integers  *conversion to integers
Algorhythm: 
            * Create a `Series` class
            * Create a getter method for `@slice_string`
            * Create a constructor method that accepts a string
              * store that value in `@slice_string`
            * Create `slices` instance method
              * accepts an integer as an argument (no validation needed)
                * `consec_times` 
             

              * raise an error if `consec_times` is larger than `slice_string` length
             

              * convert the `slice_string` to an array of integers, iterate through them
              to return the `consect_times` consecutive integers
=end

class Series
  attr_reader :slice_string

  def initialize(slice_string)
    @slice_string = slice_string
  end

  def slices(consec_times)
    raise ArgumentError.new if consec_times > slice_string.length
    slice_string.chars.map(&:to_i).each_cons(consec_times).to_a
  end
end


# two = Series.new('37103')
# p two.slices(2)

# three = Series.new('31001')
# p three.slices(3)

# five = Series.new('01234')
#p five.slices(5)

# error = Series.new('01234')
# p error.slices(6)
























