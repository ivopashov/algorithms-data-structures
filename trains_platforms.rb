class Event
  attr_reader :time, :value

  def initialize(time, value)
    @time = time
    @value = value
  end
end

def max_platforms_needed(intervals)
  events = []
  intervals.each do |i|
    events << Event.new(i[0], 1)
    events << Event.new(i[1], -1)
  end

  events = events.sort { |i1, i2| i1.time <=> i2.time }

  max = 0
  current = 0

  events.each do |event|
    current += event.value
    max = current if current > max
  end

  max
end

p max_platforms_needed([[2, 15], [9, 10], [1, 10]]) == 3
p max_platforms_needed([[1, 2], [3, 4], [5, 6]]) == 1