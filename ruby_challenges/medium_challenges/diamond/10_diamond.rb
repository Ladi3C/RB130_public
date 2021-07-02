=begin
Problem: 
        Takes an input letter, and outputs it in a diamond shape
        Given a letter, it starts off with "A"
        The supplied letter is at the WIDEST point
Example/Test Cases:

Data Structure:
Algorithm:

=end

# class Diamond
#   ALPHA = ("A".."Z").to_a

#   def self.make_diamond(letter)
#     case letter
#     when 'A'      then "A"
#     else self.diamond_maker(letter)
#     end
#   end

#   def self.diamond_maker(letter)
#     range = (ALPHA[0]..ALPHA[(ALPHA.index(letter))]).to_a
#     multiplier = range.map.with_index { |_, idx| idx + 1 }
#     top = self.top_half(range)
#     bottom = self.bottom_half(range)
#   end

#   def self.top_half(range)
#     range.map.with_index {|char, idx| puts "#{char * (idx + 1)}"}
#   end

#   def self.bottom_half(top_range)
#     bottom_range = top_range.reverse[1..-1]
#     counter = bottom_range.size
#     idx = 0
#     loop do
#       puts "#{bottom_range[idx] * counter}"
#       counter -= 1
#       idx += 1
#       break if counter == 0
#     end
#   end
# end

class Diamond
  ALPHA = ("A".."Z").to_a

  def self.make_diamond(letter)
    range = ("A"..letter).to_a + ("A"...letter).to_a.reverse
    width = range.size
    if letter == "A"
      "A\n"
    else
      self.center(self.middle_spaces(width, range), (range.size))
    end
  end

  def self.middle_spaces(width, range)
    spaces = (1..width).select { |num| num.odd?}
    middle = width / 2
    top = range[1..middle].map.with_index { |char, idx| "#{char}#{" " * spaces[idx]}#{char}"}
    bottom = range[(middle + 1)..-2].map.with_index { |char, idx| "#{char}#{" " * spaces.reverse[idx+ 2]}#{char}"}
    result = ["A"] + top + bottom + ["A"]
  end

  def self.center(output, size)
    output.map { |line| line.center(size)}.join("\n") + "\n"
  end
end

puts Diamond.make_diamond('A')
puts Diamond.make_diamond("C")
puts Diamond.make_diamond("E")




























