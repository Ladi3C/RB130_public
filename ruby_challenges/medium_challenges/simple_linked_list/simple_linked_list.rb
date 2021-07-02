=begin
Problem:
        Write a simple linked list implementation
        Linked list:
                    Fundamental data structure in computer science
                    used in implementation of other data structures

                    each element in the lsit contains tata and a 'next' field pointing to the
                    next element in thelist of elements

                    create a singly linked list
                      elements may contain a range of data numbers 1..10
                      provide functions to reverse the linked list
                      and convert a links list to and from an array

                    Each element in the LIST does not need to have information about any other
                    element in the list EXCEPT for the `next` element. 

                    Each element in the list contains data (a value) and the `next` field
                    that points to the next element in the list of elements

                    THe elements in the linked list may contain ANY data values

                    Need a method that reverses the linked list
                    Methods that convert a links list to and from am array 


Examples/Edgecases:
       `Element` class
        Constructor Method: Expects ATLEAST one argument 
                    * takes an integer as an argument
                    * takes an optional argument which is the next element
       `datum` instance method 
                    * returns the data value of the `Element` object
       `tail?` instance method
                    * returns a boolean if the current element is the `tail` of the list"
                      the last one in the list.
                      The tail element does not have another `Element` instance stored in the 
                      `next` field. 
       `next`  instance method: gives the last element added 
                    * should return `nil` if there is no next element
                      * if the current `Element` is the tial it will return `nil` check `tail?
                    * otherwise should return the next element


        `SimpleLinkedList` class
        `from_a` class method: 
                    * creates a new `SimpleLinkedList` instance from a given array argument 
        class method :
                    * converts a SimpleLinkedList instance into an array 
                      The `datum` from each link in our lsit should be an element in the returned array
        instnace method:
                    * adds its argument to the list
        instance method:
                    * removes the `head` of the list (the most recently added item on the list)
        instance method:
                    * returns the `Element` at the head of the list (frist???)
        instance method:
                    * returns the size of the list
        instance method:
                    * returns a boolean based on whether the list is empty
        instance method:
                    * returns the data value of the head element????
        instance method:
                    * returns the lsit but in reverse order
=end

# class Element
#   attr_reader :value

#   def initialize(value, next=nil)
#     @value = value
#     @next = nil
#   end

#   def datum
#     value
#   end

#   def tail?
#     next == nil ? true : false
#   end

#   def next
#     @next
#   end
# end

# class SimpleLinkedList
#   def initialize
#     @list = []
#   end

#   def self.from_a(object)
#     return [] if object == nil || object == []
#     SimpleLinkedList.new
#   end
# end


class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_elem = @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
  end

  def peek
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum)}
    list
  end

  def to_a
    array = []
    current_elem = head
    while !current_elem.nil?
      array.push(current_elem.datum)
      current_elem = current_elem.next
    end
    array
  end

  def reverse
    list = SimpleLinkedList.new
    current_elem = head
    while ! current_elem.nil?
      list.push (current_elem.datum)
      current_elem = current_elem.next
    end
    list
  end
end





























































