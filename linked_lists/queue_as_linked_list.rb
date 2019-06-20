class Node
  attr_reader :data
  attr_accessor :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedListQeueue
  def initialize
    @head = @rear = nil
  end

  def enqueue(data)
    node = Node.new data
    if @head.nil? && @rear.nil?
      @head = @rear = node
    else
      @rear.next = node
      @rear = node
    end
  end

  def dequeue
    return nil if @head.nil?
    data = @head.data
    @head = @head.next

    data
  end

  def empty?
    @head.nil?
  end

  # for debugging purposes
  def show
    temp = @head
    data = []
    while temp
      data << temp.data
      temp = temp.next
    end

    data
  end
end

queue = LinkedListQeueue.new
queue.enqueue 1
p queue.show == [1]
queue.enqueue 2
p queue.show == [1, 2]
queue.enqueue 3
p queue.show == [1, 2, 3]
queue.dequeue
p queue.show == [2, 3]
queue.dequeue
p queue.show == [3]
queue.dequeue
p queue.show == []
