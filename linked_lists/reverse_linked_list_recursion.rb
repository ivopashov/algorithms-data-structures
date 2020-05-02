# reverse linked list recursively

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end
end

head = Node.new 1
two = Node.new 2
three = Node.new 3

head.next = two
two.next = three
three.next = nil

temp = head

while temp
  p temp.data
  temp = temp.next
end

def reverse(previous_node, node)
  return if node.nil?
  next_node = node.next
  node.next = previous_node

  reverse node, next_node
end

reverse nil, head

temp = three

while temp
  p temp.data
  temp = temp.next
end
