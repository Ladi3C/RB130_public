=begin
Problem:
          Create a custom set type 
Example/TestCases:
          Constructor : 
                        * accepts multiple arguments
                        * if no argument is given, then an empty array is created
                        * store it in a saved value `set`
                        * create `subsets` of the input `set`
          `empty?`    : checks to see if `set` is empty
          `contains?` : returns true if the input integer is included in the `set`
          `subset`    : 
                        * empty array is a subset of a non empty array
                        * checks to see if the current `set` is a subset from the input array
                        * for it to be a subset it must be contiguous 
          `disjoint`  :
                        * 
          `eql?       : customize it so the compared is uniq, sorted and  
                        input compared is sorted
                        * duplicate elements DO NOT MATTER
          `add`       : appends a value to the array `set` alias `<<`
                        UNLESS that balue is already inside the `set`
          `intersection`
          `difference`: subtracts `set` array from input array
                          takes an argument
          `union`     : adds two arrays together, removes duplicates

Data Structure:
        Input :
        Output:
Algorithm:
=end

class CustomSet
  def initialize(set=[])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    set.all? { |ele| other.set.include?(ele)}
  end

  def intersection(other)
    same = set.select { |el| other.set.include?(el)}
    CustomSet.new(same)
  end

  def difference(other)
    different = set.reject { |el| other.set.include?(el)}
    CustomSet.new(different)
  end

  def disjoint?(other)
    set.none? { |el| other.set.include?(el)}
  end

  def eql?(other)
    return false unless set.length == (other.set.uniq).length
    set.all? { |el| other.set.include?(el)}
  end

  def ==(other)
    set == other.set
  end

  def add(num)
    self.set << num unless contains?(num)
  end

  def union(other)
    union_set = CustomSet.new(set)
    other.set.each { |el| union_set.add(el)}
    union_set
  end

  protected

  attr_reader :set
end

custom = CustomSet.new([1, 2, 3])
rando = CustomSet.new([4, 3, 2])  #([1, 2, 3])
p custom.difference(rando)