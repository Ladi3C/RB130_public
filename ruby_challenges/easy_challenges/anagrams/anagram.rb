=begin
Problem:
        write a program that takes  1. a word
                                    2. a list of possible anagrams
        Selects the correct sublist that contains the anagrams of that word
        returns that word?
        if there is no match.. return an EMPTY ARRAY!!!
Example:

word : listen
list : [enlists, google, inlets, banana]
=> inlets


pedac

first remove the input word from the array if it exists BECAUSE
    * a word is not an anagram of itself i.e. corn is not anagram of corn
=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    sorted = word_sort(word)
    
    list.select do |current_word| 
      word_sort(current_word.downcase) == sorted && 
      current_word.downcase != word
    end
  end

  def word_sort(current_word)
    current_word = current_word.chars.sort.join
  end
end




# wordy = Anagram.new("corn")
# p wordy.match %w(corn dark Corn rank CORN cron park)