=begin
Problem:
         Write a problem that calculates the Hamming distance between 
         two DNA strands

         mutation: mistake that occurs during the creation or copying of a nucleic
         acid, in particular DNA. Mutations create a ripple effect throughout the cell.
         point mutation : replaces one base with another at single nucleotide 

         Hamming distance : is only defined for sequences of equal length
                            if there are two sequences of unequal length,
                              cmput the hamming distance over the shorter length
        * Two strands of DNA will be givne
        * Count the differences between two strands
        * If one strand is shorter, only check the differences in the shorter
          strand

Examples/TestCases:
        * Create a DNA class
        * Constructor :
                        * accepts a DNA strand as an argument.
                        * does not raise errors
        * Method :
                        * accepts a second DNA strand as an argument,
                          returns the DIFFERENCES between both strands -- Hamming distance

Data Structure:
        Input : DNA strings 
        Output: COUNT 

How can we know which DNA strand is shorter?
How can we count the differences between them?
What kind of iteration will help?

Algorithm:
          constructor :
                        * Accepts a DNA strand string as an argument
                        * saves it for later use
          method : Computes hamming distance (`hamming_distance`)
                        * compare the lengths of both DNA strands to determine which is shorter
                        * set a counter to 0
                        * bases on the short strand's lenth, compare each character
                        * if characters are difference increase the counter
                          * continue on...

                        * return the counter
=end

class DNA
  
  def initialize(dna1)
    @dna1 = dna1.chars
  end

  def hamming_distance(dna2)
    @dna2 = dna2.chars

    if dna1_shorter?
      counter = 0
      @dna1.each_with_index do |ele, idx|
        counter += 1 if ele != dna2_shortened[idx]
      end
      counter
    else
      counter = 0
      @dna2.each_with_index { |ele, idx| counter += 1 if ele != dna1_shortened[idx]}
      counter
    end
  end

  def dna1_shorter?
    @dna1.size < @dna2.size  
  end

  def dna2_shortened
    @dna2[0..(@dna1.length - 1)]
  end

  def dna1_shortened
    @dna1[0..(@dna2.length - 1)]
  end

end

# dna1_is_short = DNA.new('AAACTAGGGG')
# p dna1_is_short.hamming_distance('AGGCTAGCGGTAGGAC')























