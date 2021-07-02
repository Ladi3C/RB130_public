=begin
Problem:
        Construct objects that represent a meetup date
        Each object takes a month number (0-12)
                            year i.e. (2021)
        The object should be able to determine the EXACT date of the meeting
          in the specified month and year

Descriptors: "first", "second", "third", "fourth", 'fifth', 'last', 'teenth'
              case is NOT important 
Example/TestCases"

Example1:
        get the second Wendesday of May 2021. 
        object should return 12th of May, 2021
        
        Constructor:
                    * Takes TWO arguments : YEAR, MONTH 
        `day` Instance Method:
                    * Takes TWO requirements: Day of the weeek, Descriptor
                    * returns year, month, date
=end
require 'date'

class Meetup
  attr_reader :year, :month

  DESCRIPTORS = %w(first second third fourth fifth last teenth)

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    weekday = weekday.downcase
    descriptor = descriptor.downcase
    start_date = Date.new(year, month, 1)
    last_day_of_month = Date.civil(year, month, -1).to_s.split("-").map(&:to_i)[-1]
    array = get_list_of_dates(start_date, weekday, last_day_of_month)

  end

  def get_list_of_dates(start_date, weekday, last_day)
    result = []
    day = 1
    case weekday
    when 'monday' then while day < last_day do 
                         current_date = Date.new(year, month, day)
                         result << current_date.to_s if current_date.monday?
                         day += 1
                       end
                       result
    when 'tuesday' then while day < last_day do 
                         current_date = Date.new(year, month, day)
                         result << current_date.to_s if current_date.tuesday?
                         day += 1
                       end
                       result
    when 'wednesday' then while day < last_day do 
                         current_date = Date.new(year, month, day)
                         result << current_date.to_s if current_date.wednesday?
                         day += 1
                       end
                       result
    when 'thursday' then while day < last_day do 
                         current_date = Date.new(year, month, day)
                         result << current_date.to_s if current_date.thursday?
                         day += 1
                       end
                       result
    when 'friday' then while day < last_day do 
                         current_date = Date.new(year, month, day)
                         result << current_date.to_s if current_date.friday?
                         day += 1
                       end
                       result
    when 'saturday' then while day < last_day do 
                         current_date = Date.new(year, month, day)
                         result << current_date.to_s if current_date.saturday?
                         day += 1
                       end
                       result
    when 'sunday' then while day < last_day do 
                         current_date = Date.new(year, month, day)
                         result << current_date.to_s if current_date.sunday?
                         day += 1
                       end
                       result  
    end


  end

end


# meetup = Meetup.new(2021, 6)
# p meetup.day('Monday', 'first')

# year = 2013
# month = 3
# day = 1
# result = []

# loop do
#   current_date = Date.new(year, month, day)
#   result << current_date.to_s if current_date.monday?
#   day += 1
#   break if day == 31
# end

# p result

# p Date.civil(year, month, -1)