=begin
Problem:
        Create a clock that is independent of date.

        Abilitiy: 
                  add minutes and subtract minutes from the time represented by a given
                  clock object
                  two clock objects that represent the same time should be equal to each other

        Do not use any built-in date or time functionality ; use ARITHMETIC operations.
Example/TestCases:
        `at` class method
             accepts up to two arguments
                first is hour 
                second is minutes
        'to_s' returns a time version of the return value of `at`
        `+` method adds on to minutes
        `-` method substracts from the minutes
        `==` method that compares if the times are equal to eachother 
=end


class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    minutes_since_midnight = compute_minutes_since_midnight + add_minutes
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(sub_minutes)
    minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
    while minutes_since_midnight < 0>
      minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format('%02d:%02d', hour, minute);
  end

  private

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    new(hours, minutes)
  end
end

# p Clock.at(8).to_s                 # "08:00"
# p Clock.at(9).to_s                 # "09:00"
# p Clock.at(11, 9).to_s             # "11:09"
