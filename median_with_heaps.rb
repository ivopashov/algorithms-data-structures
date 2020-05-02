# this one deals with finding the median in a stream of integers
# it is particularly interesting as it does it in O(nlogn) using heaps

class Median
  def initialize
    @lower = MinHeap.new
    @higher = MaxHeap.new
    @median = 0
  end

  def add(number)
    # a bunch of checks

    if @lower.size == @higher.size
      if number > @median
        @higher.add number
        @median = @higher.top
      else
        @lower.add number
        @median = @lower.top
      end
    elsif @higher.size > @lower.size
      if number > @median
        @lower.add @higher.extract
        @higher.add number
      else
        @lower.add number
      end

      @median = (@higher.top + @lower.top) / 2
    else
      if number < @median
        @higher.add @lower.extract
        @lower.add number
      else
        @higher.add number
      end

      @median = (@higher.top + @lower.top) / 2
    end

    return @median
  end
end

# TODO Implement Min and Max Heap
