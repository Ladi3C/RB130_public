=begin
Problem:
        Write a program
        Input is a word
        Computes the Scrabble score for that word
Implicit :
        * an empty string is an acceptable input
        * `nil` is an acceptable input scores 0

Examples/ Test Cases:
                     * constructor accepts a scrabble word as an argument
                     * score method calculates the scrabble scrore for a word
                          * takes no arguments
                          * returns an integer
                          * invalid words => returns 0
                          *case insensitive
                     * class method : huh?

Data Structure:
        Input : word
        output: integer
  Collections:  hash ?



=end

class Scrabble
  attr_reader :scrabble_word

  def initialize(scrabble_word)
    @scrabble_word = scrabble_word
  end

  def score
    return 0 if scrabble_word == nil
    points = 0
    scrabble_word.downcase.chars.each do |char|
      points += letter_points(char)
    end
    points
  end

  def letter_points(letter)
    case letter
    when 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' then 1
    when 'd', 'g'                                         then 2
    when 'b', 'c', 'm', 'p'                               then 3
    when 'f', 'h', 'v', 'w', 'y'                          then 4
    when 'k'                                              then 5
    when 'j', 'x'                                         then 8
    when 'q', 'z'                                         then 10
    else                                                       0
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

