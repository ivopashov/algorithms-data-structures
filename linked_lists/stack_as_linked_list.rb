class Node
  attr_reader :data
  attr_accessor :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class Stack
  def initialize
    @head = nil
  end

  def push(data)
    node = Node.new data

    if @head.nil?
      @head = node
    else
      node.next = @head
      @head = node
    end
  end

  def pop
    return nil if @head.nil?

    data = @head.data
    @head = @head.next

    data
  end

  def peek
    return nil if @head.nil?

    @head.data
  end

  def empty?
    @head.nil?
  end
end


stack = Stack.new
p stack.empty? == true

stack.push 1
stack.push 2

p stack.peek == 2
p stack.empty? == false

p stack.pop == 2
p stack.pop == 1
p stack.pop == nil
p stack.peek == nil
p stack.empty? == true
