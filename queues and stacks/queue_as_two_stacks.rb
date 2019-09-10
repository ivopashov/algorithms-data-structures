class QueueAsTwoStacks
  def initialize
    @in_stack = []
    @out_stack = []
  end

  def enqueue(element)
    @in_stack.push element
  end

  def dequeue
    return 'queue emtpy' if @in_stack.empty? && @out_stack.empty?
    return @out_stack.pop unless @out_stack.empty?

    while !@in_stack.empty? do
      @out_stack.push @in_stack.pop
    end

    return @out_stack.pop
  end
end

queue = QueueAsTwoStacks.new
queue.enqueue 1
queue.enqueue 2
queue.enqueue 3

p queue.dequeue
p queue.dequeue
p queue.dequeue
p queue.dequeue